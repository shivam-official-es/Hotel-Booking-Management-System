using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Booking_Management_System.Bind
{
    public class Rooms
    {
        public int RoomId { get; set; }
        public int RoomNumber { get; set; }
        public string RoomType { get; set; }
        public string RoomDescription { get; set; }
        public decimal RoomPrice { get; set; }
        public int GuestsCount{ get; set; }
        public string Amenities{ get; set; }
        public string RoomImagePath { get; set; }
    }
}