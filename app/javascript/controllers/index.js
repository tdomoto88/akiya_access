// Import and register all your controllers from the importmap under controllers/*
import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

.index-child {
  position: absolute;
  top: calc(50% - 512px);
  left: calc(50% - 720px);
  background-color: #d9d9d9;
  width: 1440px;
  height: 1024px;
}
.index-item {
  position: absolute;
  top: 604px;
  left: 119px;
  background-color: #fff;
  width: 1202px;
  height: 301px;
}
.index-inner {
  position: absolute;
  top: 29px;
  left: 588px;
  border-radius: 25px;
  background-color: #fff;
  width: 263px;
  height: 38px;
}
.akiya {
  margin: 0;
}
.a-link1 {
  position: absolute;
  top: 2.33%;
  left: 12.9%;
}
.a-link {
  position: absolute;
  top: 24px;
  left: 0px;
  width: 62px;
  height: 43px;
}
.an-input-child {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0%;
  right: 0%;
  bottom: 0%;
  left: 0%;
  border-radius: 25px;
  background-color: #aaa;
}
.an-input1 {
  position: absolute;
  top: 27.27%;
  left: 2.72%;
}
.an-input {
  position: absolute;
  top: 331px;
  left: 459px;
  border-radius: 25px;
  width: 526px;
  height: 44px;
  text-align: left;
}
.rectangle-div {
  position: absolute;
  top: 340px;
  left: 900px;
  border-radius: 25px;
  background-color: #999;
  width: 71px;
  height: 26px;
  mix-blend-mode: normal;
}
.card-default-child {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0%;
  right: 0%;
  bottom: 0%;
  left: 0%;
  border-radius: 4px;
  background-color: #ccc;
}
.card-default-item {
  position: absolute;
  height: 56.74%;
  width: 87.28%;
  top: 6.34%;
  right: 6.37%;
  bottom: 36.92%;
  left: 6.35%;
  border-radius: 4px;
  background-color: #999;
}
.a-button-child {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0%;
  right: 0%;
  bottom: 0%;
  left: 0%;
  border-radius: 4px;
  background-color: #000;
}
.a-button1 {
  position: absolute;
  top: 12.74%;
  left: 19.78%;
}
.a-button {
  position: absolute;
  height: 12.11%;
  width: 40.89%;
  top: 82.37%;
  right: 52.75%;
  bottom: 5.52%;
  left: 6.35%;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
.p1 {
  position: absolute;
  width: 100%;
  top: 36.36%;
  left: 0%;
  display: flex;
  align-items: center;
}
.p {
  position: absolute;
  height: 33.04%;
  width: 80.12%;
  top: 52.62%;
  right: 13.52%;
  bottom: 14.34%;
  left: 6.35%;
  text-align: justify;
  color: #000;
}
.card-default {
  position: absolute;
  top: 0px;
  left: 0px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  width: 246px;
  height: 227px;
}
.card-default1 {
  position: absolute;
  top: 0px;
  left: 285px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  width: 246px;
  height: 227px;
}
.card-default2 {
  position: absolute;
  top: 0px;
  left: 570px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  width: 246px;
  height: 227px;
}
.card-default3 {
  position: absolute;
  top: 0px;
  left: 855px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  width: 246px;
  height: 227px;
}
.cards {
  position: absolute;
  top: 638px;
  left: 169px;
  width: 1101px;
  height: 227px;
  color: #fff;
}
.p9 {
  position: absolute;
  width: 100%;
  top: -20%;
  left: 0%;
  display: flex;
  align-items: center;
}
.p8 {
  position: absolute;
  top: 346px;
  left: 916px;
  width: 39px;
  height: 15px;
  text-align: justify;
}
.index {
  width: 100%;
  position: relative;
  background-color: #fff;
  height: 1024px;
  overflow: hidden;
  text-align: center;
  font-size: 16px;
  color: #000;
  font-family: 'Source Sans Pro';
}


.search-function-popout-child {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0%;
  right: 0%;
  bottom: 0%;
  left: 0%;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 4px;
  background-color: #fff;
}
.a-button-child2 {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0%;
  right: 0%;
  bottom: 0%;
  left: 0%;
  border-radius: 4px;
  background-color: #000;
}
.a-button9 {
  position: absolute;
  top: 27.27%;
  left: 31.08%;
}
.a-button8 {
  position: absolute;
  height: 20.18%;
  width: 28.14%;
  top: 72.94%;
  right: 3.23%;
  bottom: 6.88%;
  left: 68.63%;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  cursor: pointer;
}
.search-function-popout {
  width: 526px;
  position: relative;
  height: 218px;
  max-width: 90%;
  max-height: 90%;
  overflow: auto;
  text-align: center;
  font-size: 16px;
  color: #fff;
  font-family: 'Source Sans Pro';
}

$(document).ready(function() {
  $('#property-carousel').carousel();
});

