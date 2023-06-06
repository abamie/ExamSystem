var dataTable;

$(document).ready(function () {
    loadDataTable();
});

function loadDataTable() {
    dataTable = $('#tblData').DataTable({
        "ajax": {
            "url": "/student/ExamPaper/GetStudentExamById"
        },
        "columns": [
            { "data": "displayOrder", "width": "25%" },
            { "data": "examCode", "width": "25%" },
            { "data": "student.name", "width": "25%" },
            { "data": "subject.name", "width": "25%" },
            {
                "data": "subject.id",
                "render": function (data) {
                    return `
                        <div class="w-75 btn-group" role="group">
                        <a href="/student/ExamPaper/Examintaion?id=${data}"
                        class="btn btn-primary mx-2"> <i class="bi bi-pencil-square"></i> Examiantion</a>
					</div>
                        `
                },
                "width": "25%"
            }
        ]
    });
}
