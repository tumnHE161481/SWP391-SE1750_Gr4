package Models;

public class Renter {

    private int renterID;
    private int userID;
    private int roomID;
    private boolean renterStatus;
    private boolean renterHaveRoom;
    private int CGRScore; // assuming CGRScore is an integer
    private double balance; // assuming balance is a double representing money

    public Renter() {
    }

    public Renter(int renterID, int userID, int roomID, boolean renterStatus, boolean renterHaveRoom, int CGRScore, double balance) {
        this.renterID = renterID;
        this.userID = userID;
        this.roomID = roomID;
        this.renterStatus = renterStatus;
        this.renterHaveRoom = renterHaveRoom;
        this.CGRScore = CGRScore;
        this.balance = balance;
    }

    public int getRenterID() {
        return renterID;
    }

    public void setRenterID(int renterID) {
        this.renterID = renterID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public boolean isRenterStatus() {
        return renterStatus;
    }

    public void setRenterStatus(boolean renterStatus) {
        this.renterStatus = renterStatus;
    }

    public boolean isRenterHaveRoom() {
        return renterHaveRoom;
    }

    public void setRenterHaveRoom(boolean renterHaveRoom) {
        this.renterHaveRoom = renterHaveRoom;
    }

    public int getCGRScore() {
        return CGRScore;
    }

    public void setCGRScore(int CGRScore) {
        this.CGRScore = CGRScore;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
