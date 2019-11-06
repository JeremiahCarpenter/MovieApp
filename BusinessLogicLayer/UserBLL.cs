using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class UserBLL
    {
        // this ctor is used by MVC and is required to exist
        public UserBLL()
        {

        }

        // this ctor is an example of one way to convert from the Data Access Layer
        public UserBLL(UserDAL dal)
        {
            this.UserID = dal.UserID;
            this.UserName = dal.UserName;
            this.Email = dal.Email;
            this.Password = dal.Password;
            this.RoleID = dal.RoleID;
            this.Role = dal.Role;
        }
        #region Direct Mappings
        public int UserID { get; set; }
        [DisplayName("User Name")]
        public string UserName { get; set; }
        public string Email { get; set; }
        //[DataType(DataType.Password)]
        public string Password { get; set; }
        public int RoleID { get; set; }
        #endregion Direct Mappings
        #region Indirect Mappings
        public string Role { get; set; }
        #endregion Indirect Mappings
        public override string ToString()
        {
            return $"UserID:{UserID} UserName:{UserName} Email:{Email} Password:{Password} RoleID:{RoleID} Role:{Role}";
        }
    }

}
