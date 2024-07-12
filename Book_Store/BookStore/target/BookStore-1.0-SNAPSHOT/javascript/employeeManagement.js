
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
// Biến để theo dõi trạng thái sắp xếp
let sortDirection = 1; // 1: tăng dần, -1: giảm dần

// Hàm để sắp xếp bảng dựa trên cột được chọn
function sortTable(column) {
    const table = document.querySelector("table");
    const tbody = document.querySelector("#itemList");
    const rows = Array.from(tbody.querySelectorAll("tr"));

    // Sắp xếp các hàng dữ liệu
    rows.sort((a, b) => {
        const aValue = a.querySelector(`td:nth-child(${column + 1}`).textContent;
        const bValue = b.querySelector(`td:nth-child(${column + 1}`).textContent;
        return aValue.localeCompare(bValue) * sortDirection;
    });

    // Xóa các hàng hiện tại
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    // Thêm lại các hàng đã sắp xếp
    rows.forEach(row => {
        tbody.appendChild(row);
    });

    // Đảo chiều sắp xếp cho lần nhấn tiếp theo
    sortDirection *= -1;
}


