<!DOCTYPE html>
<html>

<head>
    <title>Car Rental</title>
    <link rel="icon" href="resources/logo.png">

    <meta name="viewport" content="width=device-width initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
        integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        
  <!-- Lightbox CSS & Script -->
  <script src="resources/lightbox/ekko-lightbox.js"></script>
  <link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css" />

    <!-- AOS CSS & Script -->
    <script src="resources/aos/aos.js"></script>
    <link rel="stylesheet" href="resources/aos/aos.css" />

    <!-- custom css -->
    <link rel="stylesheet" href="resources/costum.css">

    <meta name="author" content="Rishabh Goyal" />
    <meta name="description" content="This is a website for Car Rental." />

</head>

<body>

	<%
		String msg=(String)session.getAttribute("msg");
    		if(msg!=null){
    	%>
    	<p class="p-2 bg-secondary bg-gradient text-light text-center"><%= msg %></p>
    <%
    	session.setAttribute("msg", null);
    		}
		%>
    <nav id="nav" class="navbar navbar-expand-sm container my-3">
        <a href="index.jsp" class="navbar-brand">
            <img src="resources/logo.png" height="35px">
            <label>Car<span>Rental</span></label>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar"
            aria-controls="my-navbar" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars"></i>
            <span>Menu</span>
        </button>

        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
                <li class="m-1">
                    <a href="index.jsp">Home</a>
                </li>
                <li class="m-1">
                    <a href="AdminLogin" data-toggle="modal" data-target="#AdminModal">Admin</a>
                </li>
                <li class="m-1">
                	<a href="CarOwner.jsp">CarOwner</a>
                <li class="m-1">
                    <a href="" data-toggle="modal" data-target="#myModal">Get In Touch</a>
                </li>
            </ul>
            <a id="call" href="tel:9557XXXXXX"><i class="fa-solid fa-mobile-screen-button"></i> 9557XXXXXX</a>
        </div>
    </nav>

    <section>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="resources/banner3.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="resources/banner2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="resources/banner1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="resources/banner5.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls"
                data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-target="#carouselExampleControls"
                data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </button>
        </div>
    </section>
    <section class="container p-4">
        <h1 id="rent_car" class="bg-secondary bg-gradient">Rent A Car At Low Price.</h1>
        <p class="text-secondary">Additional classifications based on seat numbers and trunk volume were also set by the
            Belgian Rent a Car association in order to provide a unified system for assessing the car types in online
            reservation systems and airline global distribution systems.</p>
    </section>

    <section class="bg-info bg-gradient p-4">
        <section class="container-fluid text-center " id="items" data-aos="zoom-in" data-aos-duration="1000">
            <h2><em>Our Offers:</em></h2>
            <div class="row my-4">
                <div class="col-lg">
                    <div class="row">
                        <div class="col-sm p-2">
                            <div class="items_card p-3">
                                <img src="resources/img1.jpg" class="card-img-top" height="100px" alt="...">
                                <h6>Rent A Car With Fully safety</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the
                                    bulk of the card's content.</p>
                            </div>
                        </div>
                        <div class="col-sm p-2">
                            <div class="items_card p-3">
                                <img src="resources/img2.jpg" class="card-img-top" height="100px" alt="...">
                                <h6>Rent A Car With Fully safety</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the
                                    bulk of the card's content.</p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg">
                    <div class="row">
                        <div class="col-sm p-2">
                            <div class="items_card p-3">
                                <img src="resources/img3.jpg" class="card-img-top" height="100px" alt="...">
                                <h6>Rent A Car With Fully safety</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the
                                    bulk of the card's content.</p>
                            </div>
                        </div>
                        <div class="col-sm p-2">
                            <div class="items_card p-3">
                                <img src="resources/img4.jpg" class="card-img-top" height="100px" alt="...">
                                <h6>Rent A Car With Fully safety</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the
                                    bulk of the card's content.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="btn btn-primary my-5 button_getInTouch" data-toggle="modal" data-target="#myModal"><b>Get In Touch</b> <i
                    class="fa-solid fa-right-long"></i></button>
        </section>
    </section>

    <section id="sec-1" class="p-5">
       
        <div class="my-5">
            <p><b>Drive Worry Free With Us.</b></p>
            <h6>24X7 Roadside assistance whenever you need <br /> we'll be with you.</h6>
            <p data-aos="fade-right" data-aos-duration="1000">
                <i class="fa-solid fa-car fa-2x"></i> <br /> <label>Drive Properly.</label>
            </p>
            <p data-aos="fade-right" data-aos-duration="1000">
                <i class="fa-solid fa-car-side fa-2x"></i> <br /> <label>Safety Checked.</label>
            </p>
            <p data-aos="fade-right" data-aos-duration="1000">
                <i class="fa-solid fa-key fa-2x"></i> <br /> <label>Security.</label>
            </p>
            <p data-aos="fade-right" data-aos-duration="1000">
                <i class="fa-regular fa-id-card fa-2x"></i> <br /> <label>Authentication.</label>
             </p>
             <button data-aos="fade-right" data-aos-duration="1000" class="btn btn-primary button_getInTouch" data-toggle="modal" data-target="#myModal"><b>Get In Touch</b> <i class="fa-solid fa-right-long"></i></button>
    </section>

    <section id="gallery" class="container my-5">
    <h3 class="mb-4"><em>Our Gallery.</em></h3>
    <a href="resources/banner1.jpg" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/banner1.jpg" alt=""></a>
    <a href="resources/banner2.jpg" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/banner2.jpg" alt=""></a>
    <a href="resources/img6.jpg" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img6.jpg" alt=""></a>
    <a href="resources/banner4.jpg" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/banner4.jpg" alt=""></a>
    <a href="resources/pexels-the-lazy-artist-gallery-1552224.jpg" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/pexels-the-lazy-artist-gallery-1552224.jpg" alt=""></a>
    </section>

    <section class="container-fluid">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224454.86352512558!2d77.32714927769456!3d28.47631679889264!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cc764eb8ab12f%3A0x51b2b709556b102f!2sRishabh%20General%20Store!5e0!3m2!1sen!2sin!4v1689340799838!5m2!1sen!2sin" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
    <footer class="bg-dark bg-gradient p-5 text-center">
        <a href="index.jsp">
            <img src="resources/logo.png" height="35px">
            <label><b>Car</b><span><b>Rental</b></span></label>
          </a>
          <br/><br>
    <p class="text-light">&copy; Rights Reserved.</p>
    <p>
      <a href="https://www.facebook.com"><i class="fa-brands fa-facebook fa-2x"></i></a>
      <a href="https://www.instagram.com"><i class="fa-brands fa-instagram fa-2x"></i></a>
      <a href="https://www.youtube.com"><i class="fa-brands fa-youtube fa-2x"></i></a>
    </p>
    </footer>
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

 <!--  Modals  -->
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-light">
              <h5 class="modal-title" id="exampleModalLabel">Get In Touch</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="AddEnquiry" method="post" >
                <div class="row">
                  <div class="col-sm mt-2">
                    <input class="form-control" type="text" name="name" pattern="[a-zA-Z ]+" maxlength="50"
                      placeholder="Your Name" required />
                  </div>
                  <div class="col-sm mt-2">
                    <input class="form-control" type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength="10"
                      placeholder="Your Phone" required />
                  </div>
                  <div class="col-sm mt-2">
                    <button class="btn btn-primary">Submit</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="modal fade" id="AdminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-success bg-gradient">
              <h5 class="modal-title text-white" id="exampleModalLabel">Admin Login</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="AdminLogin" method="post">
                <div class="row">
                  <div class="col-sm mt-2">
                    <input class="form-control" type="text" name="id" maxlength="20"
                      placeholder="Admin ID" required />
                  </div>
                  <div class="col-sm mt-2">
                    <input class="form-control" type="password" name="password" maxlength="20" 
                      placeholder="Password" required />
                  </div>
                  <div class="col-sm mt-2">
                    <button class="btn btn-primary">Login</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
</body>

<script>
	AOS.init();
    //Scroll on top
    $("#top-button").click(
    function(){
        $("html, body").animate({scrollTop: 0}, 800);
    }
);
    //script for light box
  $(document).on('click', '[data-toggle="lightbox"]', function (event) {
    event.preventDefault();
    $(this).ekkoLightbox();
  });
</script>

</html>