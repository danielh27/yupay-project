const openSidebar = () => {
  document.getElementById("accordionSidebarone").style.display = "block";
  document.querySelector(".w3-teal").classList.toggle("line-none");
  document.querySelector(".w3-teal").classList.remove("w3-teal");
}

export {openSidebar};
