using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace MovieApp
{
    class Program
    {
        static void Main()
        {
            ContextDAL ctx = new ContextDAL();
            ctx.ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=FlixOnTheNet;Integrated Security=True";
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Delete Sequence"); //deletes in order
            Console.ResetColor();
            var allMovieUsers = ctx.GetMovieUsers(0, 100);
            foreach (MovieUserDAL o in allMovieUsers)
            {
                ctx.DeleteMovieUser(o.MovieUserID);
            }
            var allUsers = ctx.GetUsers(0, 100);
            foreach (UserDAL o in allUsers)
            {
                ctx.DeleteUser(o.UserID);
            }
            var allMovies = ctx.GetMovies(0, 100);
            foreach (MovieDAL o in allMovies)
            {
                ctx.DeleteMovie(o.MovieID);
            }
            var allRoles = ctx.GetRoles(0, 100);
            foreach (RoleDAL o in allRoles)
            {
                ctx.DeleteRole(o.RoleID);
            }
            var allCategories = ctx.GetCategories(0, 100);
            foreach (CategoryDAL o in allCategories)
            {
                ctx.DeleteCategory(o.CategoryID);
            }
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("ResetDatabase Sequence");
            Console.ResetColor();
            SqlCommand cmd = new SqlCommand("TEST_ResetDatabase");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            using(var x = ctx.ExecuteCommand(cmd)) { } //only for testing purposes

            Console.ForegroundColor = ConsoleColor.Green; // creates in order
            Console.WriteLine("Create Sequence");
            Console.ResetColor();
            ctx.CreateRole ("Admin");
            ctx.CreateRole ("Owner");
            ctx.CreateRole ("Guest");

            ctx.CreateCategory ("Horror");
            ctx.CreateCategory ("War");
            ctx.CreateCategory ("Documentary");
            ctx.CreateCategory ("Western");
            ctx.CreateCategory ("Action");
            ctx.CreateCategory ("Comedy");
            ctx.CreateCategory ("Science Fiction");
            ctx.CreateCategory ("Animation");
            ctx.CreateCategory ("Crime");
            ctx.CreateCategory ("Romance");

            

            ctx.CreateUser ("spentoed","spentoed78@yahoo.com","jazzycircle33",2);
            ctx.CreateUser ("vainbasement","27vainbasement@gmail.com","lazypump15",2);
            ctx.CreateUser ("dashravine","7dashravine6@protonmail.com","hotgoose48",2);
            ctx.CreateUser ("pilotquail","pilotquail86@mail.com","brownbunny75",2);
            ctx.CreateUser ("arrivething","19arrivething@outlook.com","happycopper56",2);

            ctx.CreateUser ("wiredcloud","wiredcloud57@yahoo.com","wireadmin09",1);

            ctx.CreateMovie ("The Godfather",175,"R","The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.","https://cdn11.bigcommerce.com/s-cfnl8/images/stencil/1280x1280/products/804/1468/the-godfather-don-movie-poster-lg__83004.1386572899.jpg?c=2&imbypass=on",9);
            ctx.CreateMovie ("Forrest Gump",142,"PG-13","Watch history unfold through the perspective of an Alabama man with an IQ of 75.","https://images-na.ssl-images-amazon.com/images/I/71CHZi4vhWL._SY679_.jpg",10);
            ctx.CreateMovie ("Unbreakable",106,"PG-13","A man learns something extraordinary about himself after a devastating accident.","https://images-na.ssl-images-amazon.com/images/I/41-6emk6g6L.jpg",7);
            ctx.CreateMovie ("The Lord of the Rings: The Fellowship of the Ring",178,"PG-13","A Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.","https://d8mkdcmng3.imgix.net/b3a6/gifts-posters-lord-of-the-rings-fellowship-of-the-ring-one-sheet-maxi-poster.png?auto=format&bg=0FFF&fit=fill&h=600&q=100&w=600&s=4c29b6b64b90627c3b23b4cb04115752",5);
            ctx.CreateMovie ("The Lego Movie 2: The Second Part",107,"PG","It has been five years since everything was awesome and the citizens are facing a huge new threat","https://is5-ssl.mzstatic.com/image/thumb/Video124/v4/a1/f7/7f/a1f77f25-bcc3-7c6f-9ca6-69940606f4b2/pr_source.lsr/268x0w.png",8);
            ctx.CreateMovie ("Happy Death Day 2U",100,"PG-13","Tree Gelbman discovers that dying over and over was surprisingly easier than the dangers that lie ahead.","https://fullmovieis.com/happydeathday2/images/happy-death-day-2-movie-poster-logo-big.png",1);
            ctx.CreateMovie ("Captain Marvel",123,"PG-13","Carol Danvers becomes one of the universes most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.","https://s3.amazonaws.com/com.marvel.terrigen/prod/captainmarvel_lob_crd_06.jpg",5);
            ctx.CreateMovie ("Us",116,"R","A familys serene beach vacation turns to chaos when their doppelgängers appear and begin to terrorize them.","https://upload.wikimedia.org/wikipedia/en/thumb/0/00/Us_%282019%29_theatrical_poster.png/220px-Us_%282019%29_theatrical_poster.png",1);
            ctx.CreateMovie ("Pet Sematary",101,"R","A couple soon discovers a mysterious burial ground hidden deep in the woods near their new home.","https://is5-ssl.mzstatic.com/image/thumb/Video123/v4/94/78/a7/9478a7dc-50e7-1605-2745-b8e4ce555b95/pr_source.lsr/268x0w.png",1);
            ctx.CreateMovie ("Avengers: Endgame",181,"PG-13","The Avengers assemble once more in order to undo the actions of Thanos and restore order to the universe.","https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg",5);
            ctx.CreateMovie ("Pokémon Detective Pikachu",104,"PG","In a world where people collect Pokémon to do battle, a boy comes across an intelligent talking Pikachu who seeks to be a detective.","https://m.media-amazon.com/images/M/MV5BNDU4Mzc3NzE5NV5BMl5BanBnXkFtZTgwMzE1NzI1NzM@._V1_.jpg",6);
            ctx.CreateMovie ("John Wick: Chapter 3 - Parabellum",131,"R","Super-assassin John Wick is on the run after killing a member of the international assassins guild","https://upload.wikimedia.org/wikipedia/en/thumb/9/94/John_Wick_Chapter_3_Parabellum.png/220px-John_Wick_Chapter_3_Parabellum.png",5);
            ctx.CreateMovie ("Aladdin",128,"PG","A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.","https://imaging.broadway.com/images/custom/w735/103188-10.png",6);
            ctx.CreateMovie ("Toy Story 4",100,"G","A road trip alongside old and new friends reveals how big the world can be for a toy.","https://images.fandango.com/ImageRenderer/200/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/185803/TS4_NeonBg_Trio_1s_v10_Mech2a.jpg",8);
            ctx.CreateMovie ("The Secret Life of Pets 2",86,"PG","Continuing the story of Max and his pet friends, following their secret lives after their owners leave them for work or school each day.","https://movies.universalpictures.com/media/pt2-teaser1sheet-rgb-1sm-5be33cf7d2435-1.jpg",8);
            ctx.CreateMovie ("Rocketman",121,"R","A musical fantasy about the fantastical human story of Elton Johns breakthrough years.","https://i.pinimg.com/originals/22/bd/07/22bd074c2e5223afb0b808c1c9773e4b.png",3);
            ctx.CreateMovie ("Brightburn",90,"R","What if a child from another world crash-landed on Earth, but instead of becoming a hero to mankind, he proved to be something far more sinister?","https://upload.wikimedia.org/wikipedia/en/f/fa/Brightburn_film_poster.png",1);
            ctx.CreateMovie ("The Hustle",93,"PG-13","Female scam artists, one low rent and the other high class, who team up to take down the men who have wronged them.","https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/The_Hustle_film_poster.png/220px-The_Hustle_film_poster.png",6);
            ctx.CreateMovie ("UglyDolls",87,"PG","An animated adventure in which the free-spirited UglyDolls confront what it means to be different.","https://upload.wikimedia.org/wikipedia/en/thumb/0/06/UglyDolls_%282019%29_theatrical_poster.png/220px-UglyDolls_%282019%29_theatrical_poster.png",8);
            ctx.CreateMovie ("Shazam!", 132, "PG-13", "A streetwise fourteen-year-old foster kid can turn into the grown-up superhero Shazam.", "https://m.media-amazon.com/images/M/MV5BYTE0Yjc1NzUtMjFjMC00Y2I3LTg3NGYtNGRlMGJhYThjMTJmXkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_.jpg", 6);


            DateTime date = DateTime.Today;
            

            ctx.CreateMovieUser (1,5,date);
            ctx.CreateMovieUser (5,9,date);
            ctx.CreateMovieUser (6,6,date);
            ctx.CreateMovieUser (3,7,date);
            ctx.CreateMovieUser (10,8,date);

            Console.WriteLine("Enter UserID");
            string s = Console.ReadLine();
            int i = Convert.ToInt32(s);
            Console.WriteLine();
            Console.WriteLine(ctx.FindUserByID(i));

            Console.WriteLine();
            Console.WriteLine("Just Update User. Seperate values using a ',' ");
            string v = Console.ReadLine();
            try
            {
                string[] values = v.Split(',').ToArray();
                string Username = values[0];
                string Email = values[1];
                string Password = values[2];
                string RoleID = values[3];

                int x = Convert.ToInt32(RoleID);

                ctx.JustUpdateUser(i, Username, Email, Password, x);
                Console.WriteLine();
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("User sucessfully updated");
                Console.WriteLine(ctx.FindUserByID(i));
                Console.ResetColor();
            }
            catch
            {
                Console.WriteLine();
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("Please Follow Procedure");
                Console.ResetColor();
            }
            

        }
    }
}


