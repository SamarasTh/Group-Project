
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html > 
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> Dashboard</title>
        <link rel="icon" href="/img/paw.png" sizes="32x32">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/calendarStyle.css">
        <link rel="stylesheet" href="/css/keeper-home-style.css">
        
    </head>
    
    
    <body>
         <!--        navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>
               <br><br><br>

      
       
        
        <div class="firstflex mt-3">
            
            <article><a href=""> <svg width="1em" height="1em"   class="bi bi-person-circle"
                                      fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z" />
                    <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                    <path fill-rule="evenodd"
                          d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z" />
                    </svg></a></article>
            <article> <a href=""><svg width="1em" height="1em"  class="bi bi-bell" fill="currentColor"
                                      xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z" />
                    <path fill-rule="evenodd"
                          d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                    </svg></a></article>
            <article><a href=""><svg width="1em" height="1em"   class="bi bi-envelope-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z" />
                    </svg></a></article>
        </div>

        <!-- FLEXBOX -->
        <div class="flexbox">
            <article id="one">

            </article>
            <article id="two">

                <div class="calendar" id="calendar">
                    <div class="calendar-btn month-btn" onclick="$('#months').toggle('fast')">
                        <span id="curMonth"></span>
                        <div id="months" class="months dropdown"></div>
                    </div>

                    <div class="calendar-btn year-btn" onclick="$('#years').toggle('fast')">
                        <span id="curYear"></span>
                        <div id="years" class="years dropdown"></div>
                    </div>

                    <div class="clear"></div>

                    <div class="calendar-dates">
                        <div class="days">
                            <div class="day label">ΔΕΥ</div>
                            <div class="day label">ΤΡΙ</div>
                            <div class="day label">ΤΕΤ</div>
                            <div class="day label">ΠΕΜ</div>
                            <div class="day label">ΠΑΡ</div>
                            <div class="day label">ΣΑΒ</div>
                            <div class="day label">ΚΥΡ</div>

                            <div class="clear"></div>
                        </div>

                        <div id="calendarDays" class="days">
                        </div>
                    </div>
                </div>

                <div class="flex-container">


                    <div>κρατηση 1</div>
                    <div>κρατηση 2</div>
                    <div>κρατηση 3</div>  
                    <h5 id="kratiseis">Οι τρεις τελευταίες σου κρατήσεις!</h5> 
                </div>

            </article>
            <article id="three">




            </article>



        </div>


        <div id="centered">    
            <!-- Position absolute -->
            <div class="abs" >
                <h6> Πως λειτουργεί το ημερολόγιο;</h6>
                <span> Για αλλάξεις την διαθεσιμότητά σου, κάνε clik στην ημέρα που θέλεις να αλλάξεις. Η ένδειξη
                    εναλλάσεται ανάμεσα σε Διαθέσιμος και Μη διαθέσιμος κάθε φορά που κάνεις click (Δεν μπορείς να
                    αλλάξεις όπου υπάρχει κράτηση).

                    Μπορείς να αλλάξεις τη διαθεσιμότητά σου όσες φορές επιθυμείς και αποθηκεύεται αυτόματα καθώς
                    κάνεις τις αλλαγές.</span>
            </div>
            <div class="abs" >
                <h6> Πως αλλάζω μήνα/χρόνο; </h6>
                <span>Μπορείς να πατήσεις είτε πάνω στον μήνα είστε στο έτος για να εμφανιστεί η αντίστοιχη λίστα και
                    να μετακινηθείς στην επιθυμητή ημερομηνία.Το ημερολόγιό σου εμφανίζεται στο προφίλ σου ώστε οι
                    ιδιοκτήτες κατοικιδίων να μπορούν να ελέγχουν την διαθεσιμότητά σου πριν κάνουν κράτηση.</span>
            </div>
        </div>


        <!-- popup -->
        <div id="popup">
            <h2>Θες βοήθεια;</h2>
            <p>Στείλε μας email. Ένα μέλος της ομάδας μας θα σου απαντήσει άμεσα!</p>
            <div>
                <button>Κλείσιμο</button>
                <button >Ε-mail</button>
            </div>
        </div>
        <div id="opener" class="d-none">
            &#9754;
        </div>
        
        
        <jsp:include page="footer.jsp"></jsp:include>



        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="/js/calendarJs.js" async defer></script>

        <!-- popup -->
        <script>
                        // jQuery(document).ready( function($){} );
                        // $(document).ready( function($){ })

                        // $( function($){ });
                        jQuery(function ($) {

                            $("button:first-child").on("click", function () {

                            });


                            $("#opener").click(function () {
                                // this === Element that triggered the event
                                // $("#opener") === $(this)
                                $(this).addClass("d-none");
                                $("#popup").animate({
                                    right: "20px"
                                }, 1200);
                            });

                            $("button:first-child").click(function () {
                                // ELEMENT.style.right = "-400px";
                                // $("#popup").css("right","-400px"); // Requires a CSS transition property to be set
                                $("#popup").animate(
                                        {
                                            "right": "-400px"
                                        },
                                        1200, /* Animation in ms */
                                        function () {
                                            $("#opener").removeClass("d-none");
                                        } /* Callback function on animation end */
                                );

                            });

                        });
                        // On click modify style > right
                        // After, display key button 
        </script>
    </body>
</html>
