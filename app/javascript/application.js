// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import mrujs from "mrujs";
window.Turbo = Turbo;

mrujs.start();
