using System.Data;
using System.Data.SqlClient;


namespace Entidades
{
    public class Conexion
    {
        public string CadenaConexion = string.Empty;

        public Conexion()
        {
            CadenaConexion = "Data Source=JAIME\\SQLEXPRESS;Initial Catalog=Examenes;Integrated Security=True";
        }

        public void InsertaEmpleado(Empleado emp)
        {
            using (var conexion = new SqlConnection(CadenaConexion))
            {
    
                using (var comando = new SqlCommand("spInsertaEmpleado", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = emp.Nombre;
                    comando.Parameters.Add("@Titulo", SqlDbType.NVarChar).Value = emp.Titulo;
                    comando.Parameters.Add("@FechaNacimiento", SqlDbType.NVarChar).Value = emp.FechaNacimiento;

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

        public DataSet ConsultaEmpleados(Empleado emp)
        {
            var ds = new DataSet();
            using (var conexion = new SqlConnection(CadenaConexion))
            {
                using (var comando = new SqlCommand("spConsultaEmpleado", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@Empleado", SqlDbType.Int).Value = emp.EmpleadoId;

                    var da = new SqlDataAdapter {SelectCommand = comando};

                    conexion.Open();
                    comando.ExecuteNonQuery();
                    da.Fill(ds);
                }
            }
            return ds;
        }

        public void ActualizaEmpleado(Empleado emp)
        {
            using (var conexion = new SqlConnection(CadenaConexion))
            {

                using (var comando = new SqlCommand("spActualizaEmpleado", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = emp.Nombre;
                    comando.Parameters.Add("@Titulo", SqlDbType.NVarChar).Value = emp.Titulo;
                    comando.Parameters.Add("@FechaNacimiento", SqlDbType.NVarChar).Value = emp.FechaNacimiento;
                    comando.Parameters.Add("@FechaContratacion", SqlDbType.DateTime).Value = emp.FechaContrataion;

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }
    }
}
