// Lấy tham chiếu đến các phần tử HTML trong phần customer-table
const customerTable = document.querySelector('.customer-table');
const searchInput = customerTable.querySelector('.search-box');
const filterSelect = customerTable.querySelector('.select-box');
const tableRows = customerTable.querySelectorAll('tbody tr');


// Lắng nghe sự kiện input trên thanh tìm kiếm và change trên select
searchInput.addEventListener('input', filterTable);
filterSelect.addEventListener('change', filterTable);

filterSelect.addEventListener('change', function () {

  searchInput.value = ''; // Đặt lại giá trị thanh tìm kiếm về chuỗi trống
  filterTable();
});
function filterTable() {
  const searchTerm = searchInput.value.toLowerCase();
  const selectedOption = filterSelect.value;

  tableRows.forEach(row => {
    const cells = row.querySelectorAll('td');
    let shouldDisplay = false;

    if (selectedOption === 'all') {
      shouldDisplay = Array.from(cells).some(cell => cell.textContent.toLowerCase().includes(searchTerm));
    } else {
      const column = document.querySelector(`th[data-filter="${selectedOption}"`);
      const columnIndex = Array.from(column.parentElement.children).indexOf(column);
      shouldDisplay = cells[columnIndex].textContent.toLowerCase().includes(searchTerm);
    }

    row.style.display = shouldDisplay ? 'table-row' : 'none';
  });
}

// Pavigation

const itemList = document.getElementById('itemList');
const prevButton = document.getElementById('prevButton');
const nextButton = document.getElementById('nextButton');
const rows = itemList.querySelectorAll('tr');

const rowsPerPage = 10;
let currentPage = 1;

function showPage(pageNumber) {
    rows.forEach((row, index) => {
        if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
            row.style.display = 'table-row';
        } else {
            row.style.display = 'none';
        }
    });

}

showPage(currentPage);

prevButton.addEventListener('click', () => {

    if (currentPage > 1) {
        currentPage--;
        showPage(currentPage);
        searchInput.value = '';
    }
});

nextButton.addEventListener('click', () => {
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    if (currentPage < totalPages) {
        currentPage++;
        showPage(currentPage);
        searchInput.value = '';
    }
});

// Sort
// Định nghĩa biến lưu trạng thái sắp xếp mặc định
let currentSortColumn = null;
    let ascending = true;

    function sortTable(columnIndex) {
        const table = document.querySelector("table");
        const tbody = table.querySelector("tbody");
        const rows = Array.from(tbody.getElementsByTagName("tr"));

        rows.sort((a, b) => {
            const aValue = a.getElementsByTagName("td")[columnIndex].textContent.trim();
            const bValue = b.getElementsByTagName("td")[columnIndex].textContent.trim();

            if (ascending) {
                return aValue.localeCompare(bValue);
            } else {
                return bValue.localeCompare(aValue);
            }
        });

        while (tbody.firstChild) {
            tbody.removeChild(tbody.firstChild);
        }

        rows.forEach(row => {
            tbody.appendChild(row);
        });

        ascending = !ascending;

        // Hủy sắp xếp trường cũ nếu có
        if (currentSortColumn !== null) {
            table.rows[0].cells[currentSortColumn].classList.remove(ascending ? "asc" : "desc");
        }

        // Đánh dấu trường đang sắp xếp và cập nhật biến currentSortColumn
        currentSortColumn = columnIndex;
        table.rows[0].cells[columnIndex].classList.add(ascending ? "asc" : "desc");
    }


