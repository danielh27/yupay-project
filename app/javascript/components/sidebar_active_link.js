
const sidebar_active_link = () => {
  $('.navbar-nav .nav-link').on("click", (event) => {
     $('.navbar-nav .nav-link').removeClass('active');
     $(this).addClass('active');
   })
};

export { sidebar_active_link }
