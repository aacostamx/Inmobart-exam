using System;
using System.Web.Services;
using Entidades;

namespace AntonioAcosta
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static bool InsertaEmpleado(string nombre, string titulo, string fecha)
        {
            try
            {
                var emp = new Empleado {Nombre = nombre, Titulo = titulo, FechaNacimiento = fecha};
                new Negocio.Negocio().InsertaEmpleado(emp);
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
