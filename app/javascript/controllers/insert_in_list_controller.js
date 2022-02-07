import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["items", "dropdownProduct", "dropdownQuantity"];

  // connect() {
  //   console.log(this.element);
  //   console.log(this.itemsTarget);
  //   console.log(this.formTarget);
  //   console.log(this.dropdownProductTarget)
  // }

  send(event) {
    event.preventDefault();

    fetch(event.currentTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          let li_element = document.createElement("li");
          li_element.innerHTML = data.inserted_item;
          this.itemsTarget.appendChild(li_element);
        }
        event.currentTarget.outerHTML = data.form;
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
