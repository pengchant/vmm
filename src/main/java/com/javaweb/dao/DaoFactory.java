package com.javaweb.dao;

import javax.annotation.Resource; 
import org.springframework.stereotype.Repository;


/**
 * dao工厂类
 * @author cp
 *
 */
@Repository
public class DaoFactory {
	
	@Resource
	private AccessoryhisMapper accessoryhisMapper;
	
	@Resource
	private AccountMapper accontMapper;
 
	@Resource
	private ArrearsMapper arrearsMapper;
	
	@Resource
	private BalancesheetMapper balancesheetMapper;
	
	@Resource
	private BustatusMapper bustatusMapper;
	
	@Resource
	private ConsumsettleMapper consumsettleMapper;
	
	@Resource
	private CustomerMapper CustomerMapper;
	
	@Resource
	private CustomervisithisMapper customervisithisMapper;
	
	@Resource
	private MainitemMapper mainitemMapper;
	
	@Resource
	private MainprojregMapper mainprojregMapper;
	
	@Resource
	private MaterhisMapper materhisMapper;
 
	@Resource
	private OrdersMapper ordersMapper;
	
	@Resource
	private PartcategoryMapper partcategoryMapper;
	
	@Resource
	private PartMapper PartMapper;
	
	@Resource
	private PartprocMapper partprocMapper;
	
	@Resource
	private PartstorageMapper partstorageMapper;
	
	@Resource
	private PartusedMapper partusedMapper;
	
	@Resource
	private PaystatusMapper paystatusMapper;
	
	@Resource
	private PermissionMapper permissionMapper;
	
	@Resource
	private PersonallocateMapper personallocateMapper;
	
	@Resource
	private ProjcategoryMapper projcategoryMapper;
	
	@Resource
	private QualityinspecMapper qualityinspecMapper;
	
	@Resource
	private SectorMapper sectorMapper;
	
	@Resource
	private SupplierMapper supplierMapper;
	
	@Resource
	private UserinfoMapper userinfoMapper;
 
	@Resource 
	private UserrightsMapper userrightsMapper;
	
	@Resource 
	private VehicleMapper vehicleMapper;
	
	@Resource 
	private WarehouseMapper warehouseMapper;

	public AccessoryhisMapper getAccessoryhisMapper() {
		return accessoryhisMapper;
	}

	public void setAccessoryhisMapper(AccessoryhisMapper accessoryhisMapper) {
		this.accessoryhisMapper = accessoryhisMapper;
	}

	public AccountMapper getAccontMapper() {
		return accontMapper;
	}

	public void setAccontMapper(AccountMapper accontMapper) {
		this.accontMapper = accontMapper;
	}

	public ArrearsMapper getArrearsMapper() {
		return arrearsMapper;
	}

	public void setArrearsMapper(ArrearsMapper arrearsMapper) {
		this.arrearsMapper = arrearsMapper;
	}

	public BalancesheetMapper getBalancesheetMapper() {
		return balancesheetMapper;
	}

	public void setBalancesheetMapper(BalancesheetMapper balancesheetMapper) {
		this.balancesheetMapper = balancesheetMapper;
	}

	public BustatusMapper getBustatusMapper() {
		return bustatusMapper;
	}

	public void setBustatusMapper(BustatusMapper bustatusMapper) {
		this.bustatusMapper = bustatusMapper;
	}

	public ConsumsettleMapper getConsumsettleMapper() {
		return consumsettleMapper;
	}

	public void setConsumsettleMapper(ConsumsettleMapper consumsettleMapper) {
		this.consumsettleMapper = consumsettleMapper;
	}

	public CustomerMapper getCustomerMapper() {
		return CustomerMapper;
	}

	public void setCustomerMapper(CustomerMapper customerMapper) {
		CustomerMapper = customerMapper;
	}

	public CustomervisithisMapper getCustomervisithisMapper() {
		return customervisithisMapper;
	}

	public void setCustomervisithisMapper(CustomervisithisMapper customervisithisMapper) {
		this.customervisithisMapper = customervisithisMapper;
	}

	public MainitemMapper getMainitemMapper() {
		return mainitemMapper;
	}

	public void setMainitemMapper(MainitemMapper mainitemMapper) {
		this.mainitemMapper = mainitemMapper;
	}

	public MainprojregMapper getMainprojregMapper() {
		return mainprojregMapper;
	}

	public void setMainprojregMapper(MainprojregMapper mainprojregMapper) {
		this.mainprojregMapper = mainprojregMapper;
	}

	public MaterhisMapper getMaterhisMapper() {
		return materhisMapper;
	}

	public void setMaterhisMapper(MaterhisMapper materhisMapper) {
		this.materhisMapper = materhisMapper;
	}
 

	public OrdersMapper getOrdersMapper() {
		return ordersMapper;
	}

	public void setOrdersMapper(OrdersMapper ordersMapper) {
		this.ordersMapper = ordersMapper;
	}

	public PartcategoryMapper getPartcategoryMapper() {
		return partcategoryMapper;
	}

	public void setPartcategoryMapper(PartcategoryMapper partcategoryMapper) {
		this.partcategoryMapper = partcategoryMapper;
	}

	public PartMapper getPartMapper() {
		return PartMapper;
	}

	public void setPartMapper(PartMapper partMapper) {
		PartMapper = partMapper;
	}

	public PartprocMapper getPartprocMapper() {
		return partprocMapper;
	}

	public void setPartprocMapper(PartprocMapper partprocMapper) {
		this.partprocMapper = partprocMapper;
	}

	public PartstorageMapper getPartstorageMapper() {
		return partstorageMapper;
	}

	public void setPartstorageMapper(PartstorageMapper partstorageMapper) {
		this.partstorageMapper = partstorageMapper;
	}

	public PartusedMapper getPartusedMapper() {
		return partusedMapper;
	}

	public void setPartusedMapper(PartusedMapper partusedMapper) {
		this.partusedMapper = partusedMapper;
	}

	public PaystatusMapper getPaystatusMapper() {
		return paystatusMapper;
	}

	public void setPaystatusMapper(PaystatusMapper paystatusMapper) {
		this.paystatusMapper = paystatusMapper;
	}

	public PermissionMapper getPermissionMapper() {
		return permissionMapper;
	}

	public void setPermissionMapper(PermissionMapper permissionMapper) {
		this.permissionMapper = permissionMapper;
	}

	public PersonallocateMapper getPersonallocateMapper() {
		return personallocateMapper;
	}

	public void setPersonallocateMapper(PersonallocateMapper personallocateMapper) {
		this.personallocateMapper = personallocateMapper;
	}

	public ProjcategoryMapper getProjcategoryMapper() {
		return projcategoryMapper;
	}

	public void setProjcategoryMapper(ProjcategoryMapper projcategoryMapper) {
		this.projcategoryMapper = projcategoryMapper;
	}

	public QualityinspecMapper getQualityinspecMapper() {
		return qualityinspecMapper;
	}

	public void setQualityinspecMapper(QualityinspecMapper qualityinspecMapper) {
		this.qualityinspecMapper = qualityinspecMapper;
	}

	public SectorMapper getSectorMapper() {
		return sectorMapper;
	}

	public void setSectorMapper(SectorMapper sectorMapper) {
		this.sectorMapper = sectorMapper;
	}

	public SupplierMapper getSupplierMapper() {
		return supplierMapper;
	}

	public void setSupplierMapper(SupplierMapper supplierMapper) {
		this.supplierMapper = supplierMapper;
	}

	public UserinfoMapper getUserinfoMapper() {
		return userinfoMapper;
	}

	public void setUserinfoMapper(UserinfoMapper userinfoMapper) {
		this.userinfoMapper = userinfoMapper;
	}

 

	public UserrightsMapper getUserrightsMapper() {
		return userrightsMapper;
	}

	public void setUserrightsMapper(UserrightsMapper userrightsMapper) {
		this.userrightsMapper = userrightsMapper;
	}

	public VehicleMapper getVehicleMapper() {
		return vehicleMapper;
	}

	public void setVehicleMapper(VehicleMapper vehicleMapper) {
		this.vehicleMapper = vehicleMapper;
	}

	public WarehouseMapper getWarehouseMapper() {
		return warehouseMapper;
	}

	public void setWarehouseMapper(WarehouseMapper warehouseMapper) {
		this.warehouseMapper = warehouseMapper;
	}
	
    
}
