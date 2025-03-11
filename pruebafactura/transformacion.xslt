<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura</title>
                <style>
                    body {
                        font-family: Times New Roman, serif;
                        margin: 0;
                        padding: 20px;
                    }
                    h1 {
                        font-size: 36px;
                        margin: 0 0 20px 0;
                        font-weight: normal;
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        margin-bottom: 10px;
                    }
                    td {
                        border: 1px solid black;
                        padding: 5px;
                        vertical-align: top;
                    }
                    .header-container {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 10px;
                    }
                    .cliente-table {
                        width: 48%;
                    }
                    .factura-info {
                        width: 48%;
                    }
                    .concepto-table th {
                        border: 1px solid black;
                        font-weight: bold;
                        text-align: center;
                    }
                    .precio-celda {
                        text-align: right;
                    }
                    .total-table {
                        width: 30%;
                        margin-left: auto;
                        margin-right: 0;
                    }
                    .total-value {
                        text-align: right;
                    }
                    .center {
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <h1>Factura</h1>
                
                    
                
                <!-- Datos del Emisor -->
                <div class="header-container">
                    <table class="factura-info">
                    <tr>
                            <td colspan="2" style="text-align: center;">Factura n:<xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceHeader']/*[local-name()='InvoiceNumber']" /></td>
                        </tr>
                    <tr>
                            <td>Fecha: <span><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceIssueData']/*[local-name()='IssueDate']" /></span></td>
                        </tr>
                    <tr>
                            <td colspan="2"><xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='CorporateName']" /></td>
                        </tr>
                    <tr>
                            <td colspan="2"><xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" /></td>
                        </tr>
                    <tr>
                            <td colspan="2"><xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Address']" /> Tlf.65466323</td>
                        </tr>
                        <tr>
                            <td colspan="2"><xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Town']" />, 
                        <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Province']" /></td>
                        </tr>
                    
                    </table>
                    <!-- Datos del Receptor -->
                    <table class="cliente-table">
                    <tr>
                            <td>CLIENTE, <span><xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='Name']" /> <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='FirstSurname']" /> </span></td>
                        </tr>
                    <tr>
                            <td>N.I.F/D.N.I. <span><xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" /></span></td>
                        </tr>
                        <tr>
                            <td>Domicilio, <span><xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='Address']" /></span></td>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='PostCodeAndTown']" /> (<xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='Province']" />,<xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='OverseasAddress']/*[local-name()='CountryCode']" />)</td>
                        </tr>
                    </table>
                </div>
                

                <!-- Ítems -->

                <table class="concepto-table">
                    <tr>
                        <th style="width: 60%;">Descripción</th>
                        <th style="width: 15%;">Precio Unitario</th>
                        <th style="width: 25%;">Importe Total</th>
                    </tr>
                    <xsl:for-each select="//*[local-name()='Invoice']/*[local-name()='Items']/*[local-name()='InvoiceLine']">
                        <tr>
                            <td class="center"><xsl:value-of select="//*[local-name()='ItemDescription']" /></td>
                            <td class="precio-celda"><xsl:value-of select="//*[local-name()='UnitPriceWithoutTax']" /> €</td>
                            <td class="precio-celda"><xsl:value-of select="//*[local-name()='TotalCost']" /> €</td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Total -->
                <table class="total-table">
                    <tr>
                        <td>SUMA</td>
                        <td class="precio-celda"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalGrossAmount']" /> €</td>
                    </tr>
                    <tr>
                        <td>IVA <xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='TaxesOutputs']/*[local-name()='Tax']/*[local-name()='TaxRate']" />%</td>
                        <td class="precio-celda"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalTaxOutputs'] - //*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='TotalTaxesWithheld']" /> €</td>
                    </tr>
                    <tr>
                        <td>SUMA TOTAL</td>
                        <td class="precio-celda"><xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='InvoiceTotal']" /> €</td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
