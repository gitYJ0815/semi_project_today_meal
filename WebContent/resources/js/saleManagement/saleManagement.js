(function() {
	let body = document.querySelector("body"),
		container = document.querySelector("#container"),
		dimmed = body.querySelector(".dimmed"),
		modal = dimmed.querySelector("#modal"),
		closeButton = modal.querySelector(".close_button");

	let searchArea = container.querySelector(".search_area"),
		startYear = searchArea.querySelector("#start_year"),
		startMonth = searchArea.querySelector("#start_month"),
		startDay = searchArea.querySelector("#start_day"),
		endYear = searchArea.querySelector("#end_year"),
		endMonth = searchArea.querySelector("#end_month"),
		endDay = searchArea.querySelector("#end_day"),
		idInput = searchArea.querySelector("#id"),
		orderNumberInput = searchArea.querySelector("#orderNumber"),
		searchButton = searchArea.querySelector(".search_button");

	let resultArea = container.querySelector(".result_area"), 
		resultOption = resultArea.querySelector(".result_option"),
		selectAllInput = resultOption.querySelector("#select_all"),
		changeStatusButton = resultOption.querySelector("button"),
		resultTable = resultArea.querySelector("table"), 
		resultBody = resultTable.querySelector("tbody"), 
		resultCount = resultBody.querySelectorAll("tr").length,
		checkBoxes = resultBody.querySelectorAll("input[type=checkbox]");

	let checkCount = 0;
	let today = new Date();

	function init() {
		searchButton.addEventListener("click", searchButtonClickEventHandler);
		selectAllInput.addEventListener("change", selectAllChangeEventHandler);
		changeStatusButton.addEventListener("click", changeStatusButtonClickEventHandler);
		resultTable.addEventListener("click", resultTableClickEventHandler);
		searchArea.addEventListener("change", searchAreaChangeEventHandler);
		closeButton.addEventListener("click", closeModal);
	}

	function searchButtonClickEventHandler() {
		let startDate = new Date(startYear.value, startMonth.value-1, startDay.value),
			endDate = new Date(endYear.value, endMonth.value-1, endDay.value),
			id = idInput.value,
			orderNumber = orderNumberInput.value,
			status = true;

		if(startDate.getTime() > endDate.getTime()) {
			status = false;
			alert("입력하신 기간이 유효하지 않습니다.");
		} else if(!(/^[a-z][a-z\d]{5,11}$/.test(id))) {
			idInput.focus();
			alert("입력하신 아이디가 유효하지 않습니다.");
			status = false;
		} else if( orderNumber.length <= 0 || orderNumber.length > 10) {
			status = false;
			alert("입력하신 주문번호가 유효하지 않습니다.");
			orderNumberInput.focus();
		}

		if(status) {
			searchArea.submit();
		}
	}

	function selectAllChangeEventHandler() {
		if(this.classList.contains("active")) {
			deselectAll();
		} else {
			selectAll();
		}
	}

	function selectAll() {
		selectAllInput.classList.add("active");
		changeStatusButton.removeAttribute("disabled");
		checkCount = resultCount;

		for(let checkBox of checkBoxes) {
			checkBox.classList.add("active");
		}
	}

	function deselectAll() {
		selectAllInput.classList.remove("active");
		changeStatusButton.setAttribute("disabled", true);
		checkCount = 0;

		for(let checkBox of checkBoxes) {
			checkBox.classList.remove("active");
		}
	}

	function changeStatusButtonClickEventHandler() {
		openModal();
		modal.classList.add("change");
	}

	function openModal() {
		body.classList.add("modal_open");
		dimmed.classList.add("show");
	}

	function closeModal() {
		body.classList.remove("modal_open");
		dimmed.classList.remove("show");
		modal.classList.remove("payment");
		modal.classList.remove("change");
	}

	function resultTableClickEventHandler(e) {
		if(e.target.classList.contains("learn_more_button")) {
			learnMoreButtonClickEventHandler();
		}

		if(e.target.tagName == "INPUT") {
			if(e.target.classList.contains("active")) {
				deselectRow(e.target);
			} else {
				selectRow(e.target);
			}
		}
	}

	function learnMoreButtonClickEventHandler() {
		openModal();
		modal.classList.add("payment");

		modal.querySelector(".check_button").addEventListener("click", closeModal);
	}

	function selectRow(input) {
		input.classList.add("active");
		changeStatusButton.removeAttribute("disabled");

		if(++checkCount == resultCount) {
			selectAllInput.classList.add("active");
		}
	}

	function deselectRow(input) {
		input.classList.remove("active");

		if(--checkCount != resultCount) {
			selectAllInput.classList.remove("active");
		}

		if(checkCount == 0) {
			changeStatusButton.setAttribute("disabled", true);
		}
	}

	function initMonthSelect(year, target) {
		for(let option of target.querySelectorAll("option")) {
			option.removeAttribute("disabled");
			option.removeAttribute("selected");

			if(!(year < today.getFullYear() || (year == today.getFullYear() && option.value-1 <= today.getMonth()))) {
				option.setAttribute("disabled", true);
			}
		}

		target[0].setAttribute("selected", true);
	}

	function initDaySelect(year, month, target) {
		let lastDay = 0,
			html = "";

		switch(month) {
			case 1 : case 3 : case 5 : case 7 : case 8 : case 10 : case 12 : lastDay = 31; break;
			case 4 : case 6 : case 9 : case 11 : lastDay = 30; break;
			case 2 : lastDay = ((year%4 == 0) && (year % 100 != 0) || (year%400 == 0) ? 29 : 28); break;
			}
		
		target.innerHTML = "";

		for(let i=1; i<=lastDay; i++) {
			html += "<option value='" + i + "' " + (i == 1 ? "selected " : "") + (year < today.getFullYear() || (year == today.getFullYear() && month-1 < today.getMonth()) || (year == today.getFullYear() && month-1 <= today.getMonth() && i <= today.getDate()) ? "" : "disabled") +  ">" + i + "</option>"
		}

		target.insertAdjacentHTML("beforeend", html);
	}

	function searchAreaChangeEventHandler(e) {
		if(e.target.tagName == "SELECT") {
			if(e.target.classList.contains("year")) {
				for(let option of e.target.querySelectorAll("option")) {
					option.removeAttribute("selected");
				}

				let yearTarget = e.target,
					monthTarget = null,
					dayTarget = null,
					year = e.target.value;

				if(e.target.getAttribute("id").indexOf("start") >= 0) {
					monthTarget = startMonth;
					dayTarget = startDay;
				} else {
					monthTarget = endMonth;
					dayTarget = endDay;
				}

				yearTarget.querySelector("option[value='" + year + "']").setAttribute("selected", true);
				initMonthSelect(year, monthTarget);
				initDaySelect(Number(year), 1, dayTarget);
			} else if(e.target.classList.contains("month")) {
				for(let option of e.target.querySelectorAll("option")) {
					option.removeAttribute("selected");
				}

				let monthTarget = e.target,
					dayTarget = null,
					year = 0,
					month = monthTarget.value;

				if(e.target.getAttribute("id").indexOf("start") >= 0) {
					dayTarget = startDay;
					year = startYear.value;
				} else {
					dayTarget = endDay;
					year = endYear.value;
				}
				monthTarget.querySelector("option[value='" + month + "']").setAttribute("selected", true);
				initDaySelect(Number(year), Number(month), dayTarget);
			}
		}
	}

	window.addEventListener("DOMContentLoaded", init);
})();
