function buttonClick() {
	document.getElementById("button").addEventListener("click", hideMenu);
}

function hideMenu() {
	document.getElementById("button").classList.toggle("change");
	document.getElementById("navMenu").classList.toggle("hidden");
	document.getElementById("headerDoc").classList.toggle("hidden");
	document.getElementById("allContent").classList.toggle("hidden");
	document.getElementById("menuList").classList.toggle("menu-invisible");
}

buttonClick();