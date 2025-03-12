# Definir rutas a los archivos (rutas relativas)
$xmlPath = ".\facturaev3_2.xml"  # Archivo XML en la misma carpeta
$xsltPath = ".\transformacion.xslt"  # Archivo XSLT en la misma carpeta
$outputPath = ".\factura.html"  # Archivo de salida en la misma carpeta

# Cargar el archivo XML
$xml = New-Object System.Xml.XmlDocument
$xml.Load($xmlPath)

# Cargar el archivo XSLT
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform
$xslt.Load($xsltPath)

# Crear un escritor para el archivo de salida
$writer = New-Object System.IO.StreamWriter($outputPath)

# Aplicar la transformación XSLT al XML
$xslt.Transform($xml, $null, $writer)
$writer.Close()

Write-Host "Transformación completada. Archivo generado en $outputPath"