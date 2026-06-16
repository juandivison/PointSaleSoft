private static CliOptions ParseOptions(string[] args)
{
    if (args is null) args = Array.Empty<string>();

    var argsTrim = args
        .Where(a => !string.IsNullOrWhiteSpace(a))
        .Select(a => a.Trim())
        .ToArray();

    var delimIdx = Array.FindIndex(argsTrim, a => string.Equals(a, "--", StringComparison.Ordinal));
    string[] pathArgs;
    string[] flagsRaw;

    if (delimIdx >= 0)
    {
        pathArgs = argsTrim.Take(delimIdx).ToArray();
        flagsRaw = argsTrim.Skip(delimIdx + 1).ToArray();
    }
    else
    {
        pathArgs = argsTrim.TakeWhile(a => !a.StartsWith("-", StringComparison.Ordinal)).ToArray();
        flagsRaw = argsTrim.Skip(pathArgs.Length).ToArray();
    }

    var flags = flagsRaw.Where(x => (x ?? "").Trim() != "--").ToArray();
    var mode = ParseMode(flags);
    var fechaFactura = ParseFechaFactura(flags);
    var reprint = ParseReprintArgs(flags);
    var ecfType = ParseEcfType(flags);
    var outputCurrency = ParseOutputCurrency(flags, "USD");
    var showTotalDopOverride = ParseShowTotalDopOverride(flags);
    var saleCondition = ParseSaleCondition(flags);
    var paymentMethod = ParsePaymentMethod(flags);

    var isRecoverTimbre = string.Equals(mode, "recover-timbre", StringComparison.OrdinalIgnoreCase);

    // 1) Prioridad máxima: --input-list=...
    var inputListPath = ParseInputListPath(flags);
    if (!string.IsNullOrWhiteSpace(inputListPath))
    {
        var selectedFiles = ReadInputListFiles(inputListPath);

        if (selectedFiles.Count == 0 && !reprint.IsReprint && !isRecoverTimbre)
        {
            return new CliOptions(
                OrderFolders: Array.Empty<string>(),
                OrderFiles: Array.Empty<string>(),
                Flags: flags,
                Mode: mode,
                Reprint: reprint,
                FechaFactura: fechaFactura,
                EcfType: ecfType,
                OutputCurrency: outputCurrency,
                ShowTotalDopOverride: showTotalDopOverride,
                SaleCondition: saleCondition,
                PaymentMethod: paymentMethod,
                Error: "El archivo indicado en --input-list no contiene archivos válidos .xls/.xlsx."
            );
        }

        return new CliOptions(
            OrderFolders: Array.Empty<string>(),
            OrderFiles: selectedFiles,
            Flags: flags,
            Mode: mode,
            Reprint: reprint,
            FechaFactura: fechaFactura,
            EcfType: ecfType,
            OutputCurrency: outputCurrency,
            ShowTotalDopOverride: showTotalDopOverride,
            SaleCondition: saleCondition,
            PaymentMethod: paymentMethod,
            Error: null
        );
    }

    // 2) Compatibilidad: aceptar paths explícitos y/o carpetas
    var expandedInputs = ExpandPathInputs(pathArgs)
        .Distinct(StringComparer.OrdinalIgnoreCase)
        .ToList();

    if (expandedInputs.Count == 0)
    {
        if (reprint.IsReprint || isRecoverTimbre)
        {
            return new CliOptions(
                OrderFolders: Array.Empty<string>(),
                OrderFiles: Array.Empty<string>(),
                Flags: flags,
                Mode: mode,
                Reprint: reprint,
                FechaFactura: fechaFactura,
                EcfType: ecfType,
                OutputCurrency: outputCurrency,
                ShowTotalDopOverride: showTotalDopOverride,
                SaleCondition: saleCondition,
                PaymentMethod: paymentMethod,
                Error: null
            );
        }

        return new CliOptions(
            OrderFolders: Array.Empty<string>(),
            OrderFiles: Array.Empty<string>(),
            Flags: flags,
            Mode: mode,
            Reprint: reprint,
            FechaFactura: fechaFactura,
            EcfType: ecfType,
            OutputCurrency: outputCurrency,
            ShowTotalDopOverride: showTotalDopOverride,
            SaleCondition: saleCondition,
            PaymentMethod: paymentMethod,
            Error: "Uso: Orders2Ecf.Cli <archivo1.xls> [archivo2.xlsx ...] o <folder1[;folder2...]> [folderN] o [--input-list=archivo.json] [--fecha-factura=yyyy-MM-dd] [--mode=dummy|reprint|recover-timbre] [--reprint[=<NCF>]] [--recover-timbre] [--ncf=<NCF> | --encf=<NCF>] [--ecf-type=E31|E32|E44|E45] [--output-currency=USD|DOP] [--show-total-dop=true|false] [--sale-condition=credito|contado] [--payment-method=efectivo|tarjeta|transferencia|cheque|...]"
        );
    }

    var orderFilesExplicit = expandedInputs
        .Where(File.Exists)
        .Where(IsExcelOrderFile)
        .Distinct(StringComparer.OrdinalIgnoreCase)
        .ToList();

    var orderFolders = expandedInputs
        .Where(Directory.Exists)
        .Distinct(StringComparer.OrdinalIgnoreCase)
        .ToList();

    List<string> orderFiles;

    if (orderFilesExplicit.Count > 0)
    {
        // Si vienen archivos explícitos, procesar SOLO esos
        orderFiles = orderFilesExplicit;
    }
    else
    {
        if (orderFolders.Count == 0)
        {
            if (isRecoverTimbre)
            {
                return new CliOptions(
                    OrderFolders: Array.Empty<string>(),
                    OrderFiles: Array.Empty<string>(),
                    Flags: flags,
                    Mode: mode,
                    Reprint: reprint,
                    FechaFactura: fechaFactura,
                    EcfType: ecfType,
                    OutputCurrency: outputCurrency,
                    ShowTotalDopOverride: showTotalDopOverride,
                    SaleCondition: saleCondition,
                    PaymentMethod: paymentMethod,
                    Error: null
                );
            }

            return new CliOptions(
                OrderFolders: Array.Empty<string>(),
                OrderFiles: Array.Empty<string>(),
                Flags: flags,
                Mode: mode,
                Reprint: reprint,
                FechaFactura: fechaFactura,
                EcfType: ecfType,
                OutputCurrency: outputCurrency,
                ShowTotalDopOverride: showTotalDopOverride,
                SaleCondition: saleCondition,
                PaymentMethod: paymentMethod,
                Error: "No se encontraron archivos ni carpetas válidas."
            );
        }

        orderFiles = orderFolders
            .SelectMany(folder =>
                Directory.EnumerateFiles(folder, "*.*", SearchOption.TopDirectoryOnly)
                         .Where(IsExcelOrderFile))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        if (orderFiles.Count == 0 && !reprint.IsReprint && !isRecoverTimbre)
        {
            return new CliOptions(
                OrderFolders: orderFolders,
                OrderFiles: Array.Empty<string>(),
                Flags: flags,
                Mode: mode,
                Reprint: reprint,
                FechaFactura: fechaFactura,
                EcfType: ecfType,
                OutputCurrency: outputCurrency,
                ShowTotalDopOverride: showTotalDopOverride,
                SaleCondition: saleCondition,
                PaymentMethod: paymentMethod,
                Error: "No se encontraron archivos de órdenes .xls/.xlsx dentro de las carpetas indicadas."
            );
        }
    }

    return new CliOptions(
        OrderFolders: orderFolders,
        OrderFiles: orderFiles,
        Flags: flags,
        Mode: mode,
        Reprint: reprint,
        FechaFactura: fechaFactura,
        EcfType: ecfType,
        OutputCurrency: outputCurrency,
        ShowTotalDopOverride: showTotalDopOverride,
        SaleCondition: saleCondition,
        PaymentMethod: paymentMethod,
        Error: null
    );
}