<?php
echo "<h2>Conexión a PostgreSQL desde PHP</h2>";

$host = "192.168.56.11";
$dbname = "taller";
$user = "webuser";
$pass = "webpass";

$conn = pg_connect("host=$host dbname=$dbname user=$user password=$pass");

if (!$conn) {
    echo "<p>Error: no se pudo conectar a la base de datos.</p>";
    exit;
}

$result = pg_query($conn, "SELECT * FROM estudiantes;");

if (!$result) {
    echo "<p>Error en la consulta.</p>";
    exit;
}

echo "<table border='1' cellpadding='5'><tr><th>ID</th><th>Nombre</th></tr>";
while ($row = pg_fetch_assoc($result)) {
    echo "<tr><td>".$row['id']."</td><td>".$row['nombre']."</td></tr>";
}
echo "</table>";

pg_close($conn);
?>

