// Add Student
function addStudent() {
    var name = $('#StuName').val();
    var age = $('#StuAge').val();
    var CourseID = $('#StuDept').val();

    var Student = {
        FirstName: FirstName,
        age: age,
        CourseID: CourseID
    };

    $.ajax({
        url: 'https://localhost:7186/api/employees',
        type: 'POST',
        data: JSON.stringify(Student),
        contentType: 'application/json',
        success: function() {
            // Clear form
            $('#StudentForm')[0].reset();
            // Update Student List
            fetchEmployees();
        }
    });
}

// Add Course
function addCourse() {
    var name = $('#CourseName').val();

    var Course = {
        CourseName: CourseName
    };

    $.ajax({
        url: 'https://localhost:7186/api/departments',
        type: 'POST',
        data: JSON.stringify(Course),
        contentType: 'application/json',
        success: function() {
            // Clear form
            $('#StudentForm')[0].reset();
            // Update Student List
            fetchCourses();
        }
    });
}

// Fetch Student
function fetchStudents() {
    $.ajax({
        url: 'https://localhost:7186/api/employees',
        type: 'GET',
        success: function(data) {
            $('#StudentList').empty();
            data.forEach(function(Studnet) {
                $('#StudentList').append('<li class="list-group-item">' + Student.FirstName + ', ' + Student.age + ', ' + Student.CourseID + '</li>');
            });
        }
    });
}

// Fetch Courses
function fetchCourses() {
    $.ajax({
        url: 'https://localhost:7186/api/departments',
        type: 'GET',
        success: function(data) {
            $('#CourseList').empty();
            data.forEach(function(department) {
                $('#departmentList').append('<li class="list-group-item">' + Course.Name + '</li>');
            });
        }
    });
}

// Initial fetch
$(document).ready(function() {
    fetchStudents();
    //fetchCourses();
});











