
package Model;

public class Voucher {
    private String VoucherID;
    private String ParkID;
    private String VoucherCode;
    private double DiscountRate;
    private boolean isUsed;

    public Voucher() {
    }

    public Voucher(String VoucherID, String ParkID, String VoucherCode, double DiscountRate, boolean isUsed) {
        this.VoucherID = VoucherID;
        this.ParkID = ParkID;
        this.VoucherCode = VoucherCode;
        this.DiscountRate = DiscountRate;
        this.isUsed = isUsed;
    }

    public String getVoucherID() {
        return VoucherID;
    }

    public void setVoucherID(String VoucherID) {
        this.VoucherID = VoucherID;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getVoucherCode() {
        return VoucherCode;
    }

    public void setVoucherCode(String VoucherCode) {
        this.VoucherCode = VoucherCode;
    }

    public double getDiscountRate() {
        return DiscountRate;
    }

    public void setDiscountRate(double DiscountRate) {
        this.DiscountRate = DiscountRate;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }
    
    
}
