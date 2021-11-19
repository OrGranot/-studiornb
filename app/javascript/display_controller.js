import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['canvas'];

  connect() {
    console.log(this.element);
    console.log(this.canvasTarget);
  }
}
