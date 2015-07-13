using System;

namespace Entidades
{
    public class Empleado
    {
        public int EmpleadoId { get; set; }
        public string Nombre { get; set; }
        public string Titulo { get; set; }
        public string FechaNacimiento { get; set; }
        public DateTime FechaContrataion { get; set; }

        public Empleado()
        {
            EmpleadoId = 0;
            Nombre = string.Empty;
            Titulo = string.Empty;
            FechaNacimiento = string.Empty;
            FechaContrataion = new DateTime();
        }

        public Empleado(int empleadoId, string nombre, string titulo, string fechaNacimiento, DateTime fechaContratacion)
        {
            EmpleadoId = empleadoId;
            Nombre = nombre;
            Titulo = titulo;
            FechaNacimiento = fechaNacimiento;
            FechaContrataion = fechaContratacion;
        }
    }
}
