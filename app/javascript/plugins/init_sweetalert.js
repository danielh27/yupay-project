import Swal from 'sweetalert2';

const initSweetalert = () => {
  const confirmOrderButton = document.querySelector('#confirm-order-modal-button');
  const pendingOrdersButton = document.querySelector("#pending-orders-modal-button");

  const pendingPurchasesButton = document.querySelector("#pending-purchases-modal-button");

  const newPurchaseButton = document.querySelector("#new-purchase-button");
  const newOrderButton = document.querySelector("#new-order-button");


  const newSupplierButton = document.querySelector("#new-supplier-button");
  const newCustomerButton = document.querySelector("#new-customer-button");

  // Modal para confirmar venta
  if (confirmOrderButton) {
    confirmOrderButton.addEventListener('click', () => {

      Swal.fire({
        template: "#confirm-order-modal-template",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
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
            backdrop: 'rgba(0, 0, 0, 0.6)',
            showCloseButton: true
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

  // Modal para ventas pendientes por confirmar
  if (pendingOrdersButton) {
    pendingOrdersButton.addEventListener("click", () => {

      Swal.fire({
        template: "#pending-order-template-modal",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })
    });
  }

  // Modal para compras pendientes por confirmar
  if (pendingPurchasesButton) {
    pendingPurchasesButton.addEventListener("click", () => {

      Swal.fire({
        template: "#pending-purchases-template-modal",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })
    });
  }

  // Modal para generar una nueva compra
  if (newPurchaseButton) {
    newPurchaseButton.addEventListener("click", () => {

      Swal.fire({
        template: "#new-purchase-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })

      .then((result) => {
        const inputValue = document.querySelector("#purchase_supplier_id");

        if (inputValue.value == "" && !result.dismiss) {
          Swal.fire({
            icon: "error",
            title: "Debes seleccionar un distribuirdor",
            showCloseButton: true
          })
        }
        else if (result.isConfirmed) {
          const submitBtn = document.querySelector("#submit-new-purchase-btn");
          submitBtn.click();

        }

      });
    });
  }

  // Modal para generar una nueva venta
  if (newOrderButton) {
    newOrderButton.addEventListener("click", () => {

      Swal.fire({
        template: "#new-order-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })

        .then((result) => {
          const inputValue = document.querySelector("#order_customer_id");

          if (inputValue.value == "" && !result.dismiss) {
            Swal.fire({
              icon: "error",
              title: "Debes seleccionar un cliente",
              showCloseButton: true
            })
          }
          else if (result.isConfirmed) {
            const submitOrderBtn = document.querySelector("#submit-new-order-btn");
            submitOrderBtn.click();

          }

        });
    });
  }

  // Modal para agregar un nuevo supplier
  if (newSupplierButton) {
    newSupplierButton.addEventListener("click", () => {
      Swal.fire({
        template: "#new-supplier-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        confirmButtonColor: '#013440',
        confirmButtonText: 'Yes, delete it!',
        showCloseButton: true
      })

      .then((result) => {
        const inputSupplier = document.querySelector("#supplier_name");

        if (inputSupplier.value == "" && !result.dismiss) {
          Swal.fire({
            icon: "error",
            title: "Debes escribir un nombre",
            showCloseButton: true
          })
        }
        else if (result.isConfirmed) {
          const submitSupplierBtn = document.querySelector("#submit-new-supplier-btn");
          submitSupplierBtn.click();

        }

      });

    });
  }

  // Modal para generar una nueva compra
  if (newCustomerButton) {
    newCustomerButton.addEventListener("click", () => {
      Swal.fire({
        template: "#new-customer-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })

        .then((result) => {
          const inputSupplier = document.querySelector("#customer_name");

          if (inputSupplier.value == "" && !result.dismiss) {
            Swal.fire({
              icon: "error",
              title: "Debes escribir un nombre",
              showCloseButton: true
            })
          }
          else if (result.isConfirmed) {
            const submitCustomerBtn = document.querySelector("#submit-new-customer-btn");
            submitCustomerBtn.click();

          }

        });

    });
  }
};

export { initSweetalert };
