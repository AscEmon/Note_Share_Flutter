class SubjectModel{

static List<Subject>sub=[
  Subject(
    subjectName: "Object Oriented Programming"
  ),
   Subject(
    subjectName: "Mobile Application Development"
  ),
   Subject(
    subjectName: "Data Structure"
  ),
   Subject(
    subjectName: "Algorithm Analysis"
  ),
   Subject(
    subjectName: "DataBase Maangement System"
  ),
   Subject(
    subjectName: "Computer Network"
  ),
   Subject(
    subjectName: "Graphics Design"
  ),
   Subject(
    subjectName: "Cyber Security and Law"
  ),
   Subject(
    subjectName: "Advanced Database Management"
  ),
   Subject(
    subjectName: "Machine Learning"
  ),

];


}

class Subject {
   final int id;
   final String subjectName;
   

  Subject({this.id=0, this.subjectName});
  
}