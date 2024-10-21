<?php
include('connection/dbconfig.php');

/// Function to handle tutor deletion
function deleteTutor($tutorID) {
    global $conn;

    // First, delete associated rows from tutor_subjects
    $delete_tutor_subjects_query = "DELETE FROM tutor_subjects WHERE tutorID=?";
    $stmt = mysqli_prepare($conn, $delete_tutor_subjects_query);
    mysqli_stmt_bind_param($stmt, "i", $tutorID);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    // Now delete the tutor
    $delete_query = "DELETE FROM tutor WHERE tutorID=?";
    $stmt = mysqli_prepare($conn, $delete_query);
    mysqli_stmt_bind_param($stmt, "i", $tutorID);
    $delete_result = mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    return $delete_result;
}

// Handle tutor deletion when form is submitted
if (isset($_POST['delete_btn'])) {
    $tutorIDToDelete = $_POST['tutorID'];
    if (deleteTutor($tutorIDToDelete)) {
        header("Location: tutormanagement.php"); // Refresh the page after deletion
        exit; // Make sure to exit after redirecting
    } else {
        echo "Error deleting tutor.";
    }
}

// Handle subject assignment
if (isset($_POST['assign_subject_btn'])) {
    $tutorIDToAssign = $_POST['tutorID'];
    $subjectIDToAssign = $_POST['subjectID'];
    
    $update_query = "UPDATE tutor SET assignedSubject=? WHERE tutorID=?";
    $stmt = mysqli_prepare($conn, $update_query);
    mysqli_stmt_bind_param($stmt, "ii", $subjectIDToAssign, $tutorIDToAssign);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
}

// Fetch approved tutors
$approved_query = "SELECT * FROM tutor WHERE approvalStatus='Approved'";
$approved_result = mysqli_query($conn, $approved_query);

// Fetch declined tutors
$declined_query = "SELECT * FROM tutor WHERE approvalStatus='Declined'";
$declined_result = mysqli_query($conn, $declined_query);

// Function to display approved tutors
function displayApprovedTutors($approved_result) {
    global $conn; // Include the database connection variable
    while ($row = mysqli_fetch_assoc($approved_result)) {
        echo "<tr>";
        echo "<td>" . $row['tutorID'] . "</td>";
        echo "<td>" . $row['firstName'] . "</td>";
        echo "<td>" . $row['lastName'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['degreeProgram'] . "</td>";
        echo "<td>" . $row['year'] . "</td>";
        echo "<td><a href='" . $row['gdriveLink'] . "' target='_blank'>Drive Link</a></td>";

        // Fetch the assigned subject name
        $subjectID = $row['assignedSubject'] ?? null; // Prevent undefined index warning
        $subjectName = 'Not Assigned'; // Default value if not assigned

        if ($subjectID) {
            $subject_query = "SELECT subject_name FROM subjects WHERE id=?";
            $stmt = mysqli_prepare($conn, $subject_query);
            mysqli_stmt_bind_param($stmt, "i", $subjectID);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_bind_result($stmt, $subjectName);
            mysqli_stmt_fetch($stmt);
            mysqli_stmt_close($stmt);
        }

        // Display the assigned subject or dropdown
        echo "<td>";
        if (empty($subjectID)) {
            // Show dropdown only if no subject is assigned
            echo '<form method="POST" style="display:inline;">
                    <input type="hidden" name="tutorID" value="' . $row['tutorID'] . '">
                    <select name="subjectID" required>
                        <option value="">Select Subject</option>';
                        
            // Fetch all subjects
            $subject_query = "SELECT * FROM subjects"; // Ensure this table exists and has the right data
            $subject_result = mysqli_query($conn, $subject_query);
            
            while ($subject = mysqli_fetch_assoc($subject_result)) {
                echo '<option value="' . $subject['id'] . '">' . $subject['subject_name'] . '</option>';
            }

            echo '  </select>
                    <button type="submit" class="btn btn-success" name="assign_subject_btn">Assign</button>
                  </form>';
        } else {
            // Display the assigned subject
            echo $subjectName;
        }
        echo "</td>";

        // Buttons for delete action
        echo "<td>
                <form method='POST' style='display:inline;' onsubmit='return confirm(\"Are you sure you want to delete this tutor?\")'>
                    <input type='hidden' name='tutorID' value='" . $row['tutorID'] . "'>
                    <button type='submit' class='btn btn-danger' name='delete_btn'>DELETE</button>
                </form>
              </td>";

        echo "</tr>";
    }
}

// Function to display declined tutors
function displayDeclinedTutors($declined_result) {
    while ($row = mysqli_fetch_assoc($declined_result)) {
        echo "<tr>";
        echo "<td>" . $row['tutorID'] . "</td>";
        echo "<td>" . $row['firstName'] . "</td>";
        echo "<td>" . $row['lastName'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['degreeProgram'] . "</td>";
        echo "<td>" . $row['year'] . "</td>";
        echo "<td><a href='" . $row['gdriveLink'] . "' target='_blank'>Drive Link</a></td>";
        echo "<td>
                <form method='POST' onsubmit='return confirm(\"Are you sure you want to delete this tutor?\")'>
                    <input type='hidden' name='tutorID' value='" . $row['tutorID'] . "'>
                    <button type='submit' class='btn btn-danger' name='delete_btn'>DELETE</button>
                </form>
              </td>";
        echo "</tr>";
    }
}
?>
