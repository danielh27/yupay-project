import Swal from 'sweetalert2';

const initSweetalert = () => {
  const confirmOrderButton = document.querySelector('#confirm-order-modal-button');
  const pendingOrdersButton = document.querySelector("#pending-orders-modal-button");

  const pendingPurchasesButton = document.querySelector("#pending-purchases-modal-button");

  const newPurchaseButton = document.querySelector("#new-purchase-button");


  if (confirmOrderButton) {
    confirmOrderButton.addEventListener('click', () => {

      Swal.fire({
        template: "#confirm-order-modal-template",
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

  if (pendingOrdersButton) {
    pendingOrdersButton.addEventListener("click", () => {

      Swal.fire({
        template: "#pending-order-template-modal",
        backdrop: 'rgba(0, 0, 0, 0.6)'
      })
    });
  }

  if (pendingPurchasesButton) {
    pendingPurchasesButton.addEventListener("click", () => {

      Swal.fire({
        template: "#pending-purchases-template-modal",
        backdrop: 'rgba(0, 0, 0, 0.6)'
      })
    });
  }

  if (newPurchaseButton) {
    newPurchaseButton.addEventListener("click", () => {

      Swal.fire({
        template: "#new-purchase-form",
        backdrop: 'rgba(0, 0, 0, 0.6)'
      })

      .then((result) => {
        const inputValue = document.querySelector("#purchase_supplier_id");
        console.log(inputValue.value);

        if (inputValue.value == "") {
          Swal.fire({ icon: "error", title: "Debes seleccionar un distribuirdor"})
        }

        if (result.isConfirmed) {
          const link = document.querySelector("#submit-new-purchase-btn");
          // link.click();
        }
      });
    });
  }
};

export { initSweetalert };
