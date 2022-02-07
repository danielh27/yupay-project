import Swal from 'sweetalert2';

const initSweetalert = () => {
  const swalButton = document.querySelector('#sweet-alert-demo');

  if (swalButton) {
    swalButton.addEventListener('click', () => {

      Swal.fire({
        template: "#my-template",
        backdrop: 'rgba(0, 0, 0, 0.6)'
      })

      // Swal.fire({
      //   icon: "question",
      //   title: "¿Confirmar venta?",
      //   confirmButtonText: "Si",
      //   showCancelButton: true,
      //   cancelButtonText: "No",
      //   backdrop: 'rgba(0, 0, 0, 0.6)'
      // })

      .then((result) => {
        if (result.isConfirmed) {
          const link = document.querySelector("#confirm-button");
          link.click();

          Swal.fire({
            icon: 'success',
            title: 'Venta confirmada!',
            confirmButtonText: "Ir a movimientos",
            confirmButtonColor: "#6e7881",
            showCancelButton: true,
            cancelButtonText: "Nueva venta",
            cancelButtonColor: "#7066e0",
            reverseButtons: true,
            backdrop: 'rgba(0, 0, 0, 0.6)'
          })

          .then((result) => {
            if (result.isConfirmed || result.dismiss == Swal.DismissReason.backdrop ) {
              window.location.replace("/movements");
            } else if (result.dismiss == Swal.DismissReason.cancel) {
              window.location.replace("/orders/new");
            }
          });
        }
      });

    });
  }
};

export { initSweetalert };
