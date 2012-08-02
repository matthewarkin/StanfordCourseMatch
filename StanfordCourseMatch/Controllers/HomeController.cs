using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Web.Security;

namespace StanfordCourseMatch.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "What course are you in?";
            StanfordCoursesContainer db = new StanfordCoursesContainer();
            List<Lecture> lectures = db.Lectures.ToList();

            return View(lectures);
        }
        [Authorize]
        [HttpPost]
        public ActionResult Index(string postData)
        {
            StanfordCoursesContainer db = new StanfordCoursesContainer();
            if (Request.Form["AddLecture"] == "true")
            {
               
                db.AddToLectures(new Lecture() { Name = Request.Form["CourseName"] });
                db.SaveChanges();
            }
            if (Request.Form["AddSection"] == "true")
            {
                //StanfordCoursesContainer db = new StanfordCoursesContainer();
                int id = int.Parse(Request.Form["LectureID"]);
                Lecture lect = db.Lectures.Single(u => u.Id == id);
                lect.Sections.Add(new Section() { SectionNumber = Request.Form["SectionNumber"] });
                db.SaveChanges();
            }
            if (Request.Form["AddUser"] == "true")
            {
                //StanfordCoursesContainer db = new StanfordCoursesContainer();
                int id = int.Parse(Request.Form["SectionID"]);
                Section sect = db.Sections.Single(u => u.Id == id);
                MembershipUser user = Membership.GetUser(HttpContext.User.Identity.Name);
                sect.Users.Add(new User() { Name=user.UserName, FacebookPhoto="http://graph.facebook.com/"+user.UserName+"/picture",username=user.UserName,FacebookUrl="http://facebook.com/"+user.UserName});
                db.SaveChanges();
            }
            List<Lecture> lectures = db.Lectures.ToList();
            return View(lectures);
        }

        public ActionResult About()
        {
            ViewBag.Message = "";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Having any issues?";

            return View();
        }
    }
}
