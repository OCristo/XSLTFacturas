<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
<html>
<head>
    <title>Factura 2</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            color: #333;
        }
        .header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .factura-title {
            color: #0066cc;
            font-size: 28px;
            font-weight: bold;
        }
        .logo {
            color: #0066cc;
            font-size: 24px;
            font-weight: bold;
        }
        .info-factura {
            margin-bottom: 30px;
        }
        .info-row {
            display: flex;
            margin-bottom: 5px;
        }
        .info-label {
            width: 150px;
            font-weight: normal;
        }
        .info-value {
            width: 250px;
        }
        .client-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .client-column {
            width: 48%;
        }
        .client-title {
            color: #0066cc;
            border-bottom: 1px solid #0066cc;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .client-row {
            margin-bottom: 10px;
        }
        .client-label {
            font-weight: normal;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        th {
            color: #0066cc;
            text-align: left;
            border-bottom: 1px solid #0066cc;
            padding: 8px 10px;
            font-weight: normal;
        }
        td {
            padding: 8px 10px;
            border-bottom: 1px solid #e0e0e0;
        }
        .text-right {
            text-align: right;
        }
        .totals {
            width: 300px;
            margin-left: auto;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        .total-label {
            color: #0066cc;
            font-weight: bold;
        }
        .total-value {
            text-align: right;
            min-width: 100px;
        }
        .grand-total {
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }
        .comments {
            margin-top: 30px;
        }
        .comments-title {
            color: #0066cc;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="factura-title">Factura</div>
        <div class="logo">DECLARANDO</div>
    </div>

    <div class="info-factura">
        <div class="info-row">
            <div class="info-label">Fecha de factura:</div>
            <div class="info-value"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceIssueData']/*[local-name()='IssueDate']" /></div>
        </div>
        <div class="info-row">
            <div class="info-label">Número de factura:</div>
            <div class="info-value"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceHeader']/*[local-name()='InvoiceNumber']" /></div>
        </div>
        <div class="info-row">
            <div class="info-label">Fecha de vencimiento:</div>
            <div class="info-value"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceIssueData']/*[local-name()='InvoicingPeriod']/*[local-name()='EndDate']" /></div>
        </div>
    </div>

    <div class="client-info">
        <div class="client-column">
            <div class="client-title"><xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='CorporateName']" /></div>
            <div class="client-row">
                <div class="client-label">Dirección: <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Address']" /></div>
            </div>
            <div class="client-row">
                <div class="client-label">NIF: <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" /></div>
            </div>
            <div class="client-row">
                <div class="client-label">CP y ciudad: <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Address']" /></div>
            </div>
            <div class="client-row">
                <div class="client-label">Email: <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='ContactDetails']/*[local-name()='ElectronicMail']" /></div>
            </div>
        </div>
        <div class="client-column">
            <div class="client-title"><xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='Name']" /> <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='FirstSurname']" /></div>
            <div class="client-row">
                <div class="client-label">Dirección: <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='Address']" /></div>
            </div>
            <div class="client-row">
                <div class="client-label">CIF: <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" /></div>
            </div>
            <div class="client-row">
                <div class="client-label">CP y ciudad: <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='PostCodeAndTown']" /> (<xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='Province']" />,<xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='CountryCode']" />)</div>
            </div>
            <div class="client-row">
                <div class="client-label">tlf: <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='ContactDetails']/*[local-name()='Telephone']" /></div>
            </div>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>Descripción</th>
                <th>Unidades</th>
                <th>Precio Unitario (€)</th>
                <th>Precio (€)</th>
            </tr>
        </thead>
        <tbody>
            <xsl:for-each select="//*[local-name()='Invoice']/*[local-name()='Items']/*[local-name()='InvoiceLine']">
                        <tr>
                            <td class="center"><xsl:value-of select="//*[local-name()='ItemDescription']" /></td>
                            <td><xsl:value-of select="//*[local-name()='Quantity']" /></td>
                            <td class="text-right"><xsl:value-of select="//*[local-name()='UnitPriceWithoutTax']" /> €</td>
                            <td class="text-right"><xsl:value-of select="//*[local-name()='TotalCost']" /> €</td>
                        </tr>
                    </xsl:for-each>
        </tbody>
    </table>

    <div class="totals">
        <div class="total-row">
            <div class="total-label">BASE IMPONIBLE:</div>
            <div class="total-value"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalGrossAmount']" /> €</div>
        </div>
        <div class="total-row">
            <div class="total-label">IVA (<xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='TaxesOutputs']/*[local-name()='Tax']/*[local-name()='TaxRate']" />%) :</div>
            <div class="total-value"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalTaxOutputs'] - //*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalTaxesWithheld']" /> €</div>
        </div>
        <div class="total-row">
            <div class="total-label">TOTAL:</div>
            <div class="total-value grand-total"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='InvoiceTotal']" /> €</div>
        </div>
    </div>

    <div class="comments">
        <div class="comments-title">Comentarios:</div>
        <p>Pago por transferencia: <xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='PaymentDetails']/*[local-name()='Installment']/*[local-name()='AccountToBeDebited']/*[local-name()='IBAN']" /></p>
    </div>
</body>
</html>
    </xsl:template>
</xsl:stylesheet>
