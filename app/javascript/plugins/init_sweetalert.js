import Swal from 'sweetalert2';

const initSweetalert = () => {
  const confirmOrderButton = document.querySelector('#confirm-order-modal-button');
  const confirmPurchaseButton = document.querySelector('#confirm-purchase-modal-button');

  const pendingOrdersButton = document.querySelector("#pending-orders-modal-button");

  const pendingPurchasesButton = document.querySelector("#pending-purchases-modal-button");

  const newPurchaseButton = document.querySelector("#new-purchase-button");
  const newOrderButton = document.querySelector("#new-order-button");


  const newSupplierButton = document.querySelector("#new-supplier-button");
  const newCustomerButton = document.querySelector("#new-customer-button");

  // Modal para confirmar venta
  if (confirmOrderButton) {
    confirmOrderButton.addEventListener('click', () => {

     const listItemsCount = document.querySelector(".items-table-container tbody").childElementCount

      if (listItemsCount < 1) {

        Swal.fire({
          icon: "error",
          title: "Debes añadir al menos un producto",
          color: '#013440',
          confirmButtonColor: '#013440'
        })

      } else {

        Swal.fire({

          template: "#confirm-order-modal-template",
          backdrop: 'rgba(0, 0, 0, 0.6)',
          confirmButtonColor: '#013440',
          cancelButtonColor: '#F20F38',
          color: '#013440',
          // buttonsStyling: false,
          showCloseButton: true
        })

        .then((result) => {
          if (result.isConfirmed) {
            const link = document.querySelector("#confirm-button");
            link.click();

            Swal.fire({
              iconColor: '#739096',
              color: '#013440',
              icon: 'success',
              title: 'Venta confirmada!',
              confirmButtonText: "Ir a movimientos",
              confirmButtonColor: "#F20F38",
              showCancelButton: true,
              cancelButtonText: "Nueva venta",
              cancelButtonColor: "#013440",
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

      }


    });
  }

  // Modal para confirmar compra
  if (confirmPurchaseButton) {
    confirmPurchaseButton.addEventListener('click', () => {

      const listItemsCount = document.querySelector(".items-table-container tbody").childElementCount

      if (listItemsCount < 1) {

        Swal.fire({
          icon: "error",
          title: "Debes añadir al menos un producto",
          color: '#013440',
          confirmButtonColor: '#013440'
        })

      } else {

        Swal.fire({
          template: "#confirm-purchase-modal-template",
          backdrop: 'rgba(0, 0, 0, 0.6)',
          confirmButtonColor: '#013440',
          cancelButtonColor: '#F20F38',
          color: '#013440',
          // buttonsStyling: false,
          showCloseButton: true
        })

          .then((result) => {
            if (result.isConfirmed) {
              const link = document.querySelector("#confirm-button");
              link.click();

              Swal.fire({
                iconColor: '#739096',
                color: '#013440',
                icon: 'success',
                title: 'Compra confirmada!',
                confirmButtonText: "Ir a movimientos",
                confirmButtonColor: "#F20F38",
                showCancelButton: true,
                cancelButtonText: "Nueva venta",
                cancelButtonColor: "#013440",
                reverseButtons: true,
                backdrop: 'rgba(0, 0, 0, 0.6)',
                showCloseButton: true
              })

                .then((result) => {
                  if (result.isConfirmed || result.dismiss == Swal.DismissReason.backdrop) {
                    window.location.replace("/movements");
                  } else if (result.dismiss == Swal.DismissReason.cancel) {
                    window.location.replace("/orders/new");
                  }
                });
            }
          });

      }


    });
  }

  // Modal para ventas pendientes por confirmar
  if (pendingOrdersButton) {
    pendingOrdersButton.addEventListener("click", () => {

      Swal.fire({
        iconColor: '#739096',
        template: "#pending-order-template-modal",
        color: '#013440',

        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })
    });
  }

  // Modal para compras pendientes por confirmar
  if (pendingPurchasesButton) {
    pendingPurchasesButton.addEventListener("click", () => {

      Swal.fire({
        iconColor: '#739096',
        template: "#pending-purchases-template-modal",
        color: '#013440',
        backdrop: 'rgba(0, 0, 0, 0.6)',
        showCloseButton: true
      })
    });
  }

  // Modal para generar una nueva compra
  if (newPurchaseButton) {
    newPurchaseButton.addEventListener("click", () => {

      Swal.fire({
        iconColor: '#739096',
        template: "#new-purchase-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        // title: '<h2 class="text-title">Selecciona un proveedor</h2>',
        color: '#013440',
        confirmButtonColor: '#013440',
        confirmButtonText: 'Agregar',
        showCloseButton: true
      })

      .then((result) => {
        const inputValue = document.querySelector("#purchase_supplier_id");

        if (inputValue.value == "" && !result.dismiss) {
          Swal.fire({
            icon: "error",
            iconColor: '#F20F38',
            confirmButtonColor: '#013440',
            title: "<h2 style='color: #013440;'>Debes seleccionar un distribuirdor</h2>",
            titleColor: '#013440',
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
        iconColor: '#739096',
        template: "#new-order-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        confirmButtonColor: '#013440',
        confirmButtonText: 'Agregar',
        color: '#013440',
        showCloseButton: true
      })

        .then((result) => {
          const inputValue = document.querySelector("#order_customer_id");

          if (inputValue.value == "" && !result.dismiss) {
            Swal.fire({
              icon: "error",
              iconColor: '#F20F38',
              confirmButtonColor: '#013440',
              title: "<h2 style='color: #013440;'>Debes seleccionar un cliente</h2>",
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
        iconColor: '#739096',
        template: "#new-supplier-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        confirmButtonColor: '#013440',
        confirmButtonText: 'Agregar',
        color: '#013440',
        showCloseButton: true
      })

      .then((result) => {
        const inputSupplier = document.querySelector("#supplier_name");

        if (inputSupplier.value == "" && !result.dismiss) {
          Swal.fire({
            icon: "error",
            iconColor: '#F20F38',
            confirmButtonColor: '#013440',
            title: "<h2 style='color: #013440;'>Debes escribir un nombre</h2>",
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
        iconColor: '#739096',
        template: "#new-customer-form",
        backdrop: 'rgba(0, 0, 0, 0.6)',
        confirmButtonColor: '#013440',
        confirmButtonText: 'Agregar',
        color: '#013440',
        showCloseButton: true
      })

        .then((result) => {
          const inputSupplier = document.querySelector("#customer_name");

          if (inputSupplier.value == "" && !result.dismiss) {
            Swal.fire({
              icon: "error",
              iconColor: '#F20F38',
              confirmButtonColor: '#013440',
              title: "<h2 style='color: #013440;'>Debes escribir un nombre</h2>",
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
