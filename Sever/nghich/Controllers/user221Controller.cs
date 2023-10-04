using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using nghich.Models;

namespace nghich.Controllers
{
    public class user221Controller : Controller
    {
        private apiappEntities1 db = new apiappEntities1();

        // GET: user221
        public ActionResult Index()
        {
            return View(db.user22.ToList());
        }

        // GET: user221/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user22 user22 = db.user22.Find(id);
            if (user22 == null)
            {
                return HttpNotFound();
            }
            return View(user22);
        }

        // GET: user221/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: user221/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,password,age,number,email,avatar")] user22 user22)
        {
            if (ModelState.IsValid)
            {
                db.user22.Add(user22);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(user22);
        }

        // GET: user221/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user22 user22 = db.user22.Find(id);
            if (user22 == null)
            {
                return HttpNotFound();
            }
            return View(user22);
        }

        // POST: user221/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,password,age,number,email,avatar")] user22 user22)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user22).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user22);
        }

        // GET: user221/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user22 user22 = db.user22.Find(id);
            if (user22 == null)
            {
                return HttpNotFound();
            }
            return View(user22);
        }

        // POST: user221/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            user22 user22 = db.user22.Find(id);
            db.user22.Remove(user22);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
