let
  userName = "Ebbe Flisbäck";
  email = "ebbe.flisback@gmail.com";
in
{
    programs.git = {
        enable = true;
        userName = userName;
        userEmail = email;
    };
}
