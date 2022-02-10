import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["items", "modal_items_template", "total_sum"];

  // connect() {
    // console.log(this.element);
    // console.log(this.itemsTarget);
    // console.log(this.total_sumTarget);
    // console.log(this.modal_items_templateTarget.content.querySelector("tbody"));
  // }

  send(event) {
    event.preventDefault();
    let currentForm = event.currentTarget;

    fetch(event.currentTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          let list_item = document.createElement("tr");
          list_item.innerHTML = data.inserted_item;

          let modal_list_item = document.createElement("tr");
          modal_list_item.innerHTML = data.inserted_modal_item;

          this.itemsTarget.appendChild(list_item);
          this.modal_items_templateTarget.content.querySelector("tbody").appendChild(modal_list_item);

          this.total_sumTarget.innerText = `S/ ${data.total_sum}`
        }
        currentForm.outerHTML = data.form;
      });
  }

  // update_select_options(event) {

  //   while (this.dropdownQuantityTarget.length > 0) {
  //     this.dropdownQuantityTarget.remove(0);
  //   }

  //   fetch(`/products/${this.dropdownProductTarget.value}`, { method: 'GET', headers: { 'Accept': "application/json" }})
  //     .then(response => response.json())
  //     .then(data => {
  //       for (let number = 1; number <= data.product_stock; number++) {
  //         let option = document.createElement("option");
  //         option.textContent = number;
  //         option.value = number;
  //         this.dropdownQuantityTarget.add(option);
  //       }
  //     });
  // }
}
