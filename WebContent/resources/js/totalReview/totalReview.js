/**
 * 
 */

(function() {
	let body = document.querySelector("body"),
		dimmed = body.querySelector(".dimmed"),
		modal = dimmed.querySelector("#modal");

	let resultArea = body.querySelector(".result_area"),
		filter = resultArea.querySelector(".filter"),
		category = filter.querySelector(".category"),
		result = resultArea.querySelector(".result");

	function init() {
		category.addEventListener("change", categoryChangeEventHandler);
		result.addEventListener("click", resultClickEventHandler);
		modal.addEventListener("click", modalClickEventListener);
	}

	function categoryChangeEventHandler(e) {
		if(e.target.tagName == "INPUT") {
			if(e.target.classList.contains("active")) {
				e.target.classList.remove("active");
			} else {
				e.target.classList.add("active");
			}
		}
	}

	function resultClickEventHandler(e) {
		if(e.target.tagName == "BUTTON") {
			if(e.target.classList.contains("detail_button")) {
				detailButtonClickEventHandler();
			} else if(e.target.classList.contains("buy_button")) {
				buyButtonClickEventHandler();
			} else if(e.target.classList.contains("more_button")) {

			} else {
				likeButtonToggleEventHandler(e.target);
			}
		}
	}

	function detailButtonClickEventHandler() {
		openModal();
		modal.classList.add("detail_review");
	}

	function buyButtonClickEventHandler() {
		openModal();
		modal.classList.add("cart");
	}

	function likeButtonToggleEventHandler(likeButton) {
		if(likeButton.classList.contains("active")) {
			likeButton.classList.remove("active");
			likeButton.innerHTML = "좋아요 버튼";
		} else {
			likeButton.classList.add("active");
			likeButton.innerHTML = "좋아요 해제 버튼";
		}
	}

	function modalClickEventListener(e) {
		if(e.target.tagName == "BUTTON") {
			if(e.target.classList.contains("close_button")) {
				closeModal();
			} else if(e.target.closest(".detail_review_inner")) {
				if(e.target.classList.contains("buy_button")) {
					closeModal();
				} else if(e.target.classList.contains("option")) {
					optionButtonToggleEventHandler(e.target);
				} else if(e.target.closest(".like_area")){
					likeButtonToggleEventHandler(e.target);
				}
			} else if(e.target.closest(".cart_inner")) {
				if(e.target.classList.contains("confirm_button")) {

				} else {
					closeModal();
				}
			}
		}
	}

	function openModal() {
		body.classList.add("modal_open");
		dimmed.classList.add("show");
	}

	function closeModal() {
		body.classList.remove("modal_open");
		dimmed.classList.remove("show");
		modal.classList.remove("detail_review");
		modal.classList.remove("cart");
	}

	function optionButtonToggleEventHandler(optionButton) {
		let optionArea = optionButton.closest(".option_area");

		if (optionArea.classList.contains("layer_open")) {
			optionArea.classList.remove("layer_open");
		} else {
			optionArea.classList.add("layer_open");
		}
	}

	window.addEventListener("DOMContentLoaded", init);
})();