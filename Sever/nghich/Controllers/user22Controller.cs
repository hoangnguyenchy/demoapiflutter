using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using nghich.Models;

namespace nghich.Controllers
{
    public class user22Controller : ApiController
    {
        private apiappEntities1 db = new apiappEntities1();

        // GET: api/user22
        public IQueryable<user22> Getuser22()
        {
            return db.user22;
        }

        // GET: api/user22/5
        [ResponseType(typeof(user22))]
        public IHttpActionResult Getuser22(int id)
        {
            user22 user22 = db.user22.Find(id);
            if (user22 == null)
            {
                return NotFound();
            }

            return Ok(user22);
        }

        // PUT: api/user22/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putuser22(int id, user22 user22)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user22.id)
            {
                return BadRequest();
            }

            db.Entry(user22).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!user22Exists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/user22
        [ResponseType(typeof(user22))]
        public IHttpActionResult Postuser22(user22 user22)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.user22.Add(user22);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = user22.id }, user22);
        }

        // DELETE: api/user22/5
        [ResponseType(typeof(user22))]
        public IHttpActionResult Deleteuser22(int id)
        {
            user22 user22 = db.user22.Find(id);
            if (user22 == null)
            {
                return NotFound();
            }

            db.user22.Remove(user22);
            db.SaveChanges();

            return Ok(user22);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool user22Exists(int id)
        {
            return db.user22.Count(e => e.id == id) > 0;
        }
    }
}