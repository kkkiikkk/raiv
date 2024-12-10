import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["localeSelect"];

  changeLocale() {
    const locale = this.localeSelectTarget.value;
    const currentPath = window.location.pathname;
    const localeRegex = /^\/(en|ru|ua|de)(\/|$)/;
    let newPath;

    if (localeRegex.test(currentPath)) {
      newPath = currentPath.replace(localeRegex, `/${locale}/`);
    } else {
      newPath = `/${locale}${currentPath}`;
    }

    window.location.pathname = newPath;
  }
}
