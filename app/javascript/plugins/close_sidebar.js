const closeSidebar = () => {
  document.getElementById("accordionSidebarone").style.display = "none";
  document.getElementById("menu-line").classList.toggle("line-none");
  document.getElementById("menu-line").classList.add("w3-teal");
}

export {closeSidebar};
