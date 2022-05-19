using System.Threading;
using System.Web.Http;

namespace WindowsAuth.Controllers
{
    public class DefaultController : ApiController
    {
        [Route("~/")]
        [AllowAnonymous]
        [HttpGet]
        public IHttpActionResult Root()
        {
            return Ok("Howdy! I am a Windows Authentication test app!");
        }

        [Route("~/auth")]
        [HttpGet]
        [Authorize]
        public IHttpActionResult Auth()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($"Logged in as {identity.Name} via method {identity.AuthenticationType}.");
        }
    }
}
