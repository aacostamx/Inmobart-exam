using System.Data;
using Entidades;

namespace Negocio
{
    public class Negocio
    {
        public void InsertaEmpleado(Empleado emp)
        {
            new Conexion().InsertaEmpleado(emp);
        }

        public DataSet ConsultaEmpleados(Empleado emp)
        {
            DataSet ds = new Conexion().ConsultaEmpleados(emp);
            return ds;
        }

        public void ActualizaEmpleado(Empleado emp)
        {
            new Conexion().ActualizaEmpleado(emp);
        }
    }
}
