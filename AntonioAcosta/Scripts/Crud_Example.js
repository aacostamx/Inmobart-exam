function InsertarEmpleado()
{
    var nombre;
	var titulo;
    var fechaNacimiento;

    nombre = document.getElementById("inputNombre").value;
    titulo = document.getElementById("inputTitulo").value;
    fechaNacimiento = document.getElementById("inputFechaNac").value;

    if(nombre && titulo)
    {
        var jdata = "{Nombre: '" + nombre + "', titulo: '" + titulo + "', fecha: '" + fechaNacimiento + "'}";
        
        $.ajax({
            type: "POST",
            cache: false,
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:49716/Default.aspx/InsertaEmpleado",
            data: "{nombre: '" + nombre + "', titulo: '" + titulo + "', fecha: '" + fechaNacimiento + "'}",
            dataType: "json",
            async: false,
            success: function (data) {
                var server_response = data.d;
                if (server_response) {
                    alert("El empleado " + nombre + " ha sido dado de alta");
                }
                else {
                    alert("No fue posible dar de alta al empleado " + nombre );
                }
            },
            error: function (result) {
                alert("ERROR " + result.status + ' ' + result.statusText);
            }
        });
    }
    else
    {
        alert("Favor de ingresar todos los campos");
    }

//    document.getElementById("inputNombre").value = "";
//        document.getElementById("inputTitulo").value = "";
//    document.getElementById("inputFechaNac").value = "";
}

function LimpiaInputs() {
    document.getElementById("inputNombre").value = "";
    document.getElementById("inputTitulo").value = "";
    document.getElementById("inputFechaNac").value = "";
}