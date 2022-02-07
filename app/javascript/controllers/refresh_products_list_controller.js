import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "results", "searchInput"]

  // connect() {
  //   console.log(this.element);
  //   console.log(this.formTarget);
  //   console.log(this.resultsTarget);
  //   console.log(this.searchInputTarget);
  // }



  update() {

    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.outerHTML = data;
      })
  }
}
