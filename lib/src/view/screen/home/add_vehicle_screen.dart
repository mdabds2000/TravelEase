import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';

import '../auth/widgets/auth_txtField.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vehicleNameController = TextEditingController();
  final _vehicleTypeController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _capacityController = TextEditingController();
  final _dimensionsController = TextEditingController();
  final _fuelTypeController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _modelYearController = TextEditingController();
  final _insuranceNumberController = TextEditingController();
  final _insuranceExpiryController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  final _registrationExpiryController = TextEditingController();

  String? _selectedVehicleCategory;
  final List<String> _vehicleCategories = [
    'Container Truck',
    'Flatbed Truck',
    'Refrigerated Truck',
    'Tanker Truck',
    'Dump Truck',
    'Car Carrier'
  ];

  String? _selectedFuelType;
  final List<String> _fuelTypes = [
    'Diesel',
    'Petrol',
    'CNG',
    'Electric',
    'Hybrid'
  ];

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _vehicleTypeController.dispose();
    _vehicleNumberController.dispose();
    _capacityController.dispose();
    _dimensionsController.dispose();
    _fuelTypeController.dispose();
    _manufacturerController.dispose();
    _modelYearController.dispose();
    _insuranceNumberController.dispose();
    _insuranceExpiryController.dispose();
    _registrationNumberController.dispose();
    _registrationExpiryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Vehicle', style: h2Style),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Information Section
              Text('Basic Information',
                  style: h2Style.copyWith(fontSize: 18.sp)),
              2.vSpace,
              AuthField(
                controller: _vehicleNameController,
                hintText: 'Enter vehicle name',
                labelText: 'Vehicle Name*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter vehicle name';
                  }
                  return null;
                },
              ),
              1.vSpace,
              DropdownButtonFormField<String>(
                value: _selectedVehicleCategory,
                decoration: InputDecoration(
                  labelText: 'Vehicle Category*',
                  labelStyle: h4Style.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.greyDark,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
                ),
                items: _vehicleCategories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: h4Style),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedVehicleCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select vehicle category';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _vehicleNumberController,
                hintText: 'Enter vehicle number',
                labelText: 'Vehicle Number*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter vehicle number';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _manufacturerController,
                hintText: 'Enter manufacturer',
                labelText: 'Manufacturer*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter manufacturer';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _modelYearController,
                hintText: 'Enter model year',
                labelText: 'Model Year*',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter model year';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
              ),
              2.vSpace,

              // Specifications Section
              Text('Specifications', style: h2Style.copyWith(fontSize: 18.sp)),
              2.vSpace,
              AuthField(
                controller: _capacityController,
                hintText: 'Enter capacity in kg',
                labelText: 'Load Capacity (kg)*',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter capacity';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _dimensionsController,
                hintText: 'L x W x H (in meters)',
                labelText: 'Dimensions*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter dimensions';
                  }
                  return null;
                },
              ),
              1.vSpace,
              DropdownButtonFormField<String>(
                value: _selectedFuelType,
                decoration: InputDecoration(
                  labelText: 'Fuel Type*',
                  labelStyle: h4Style.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.greyDark,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
                ),
                items: _fuelTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: h4Style),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedFuelType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select fuel type';
                  }
                  return null;
                },
              ),
              2.vSpace,

              // Registration & Insurance Section
              Text('Registration & Insurance',
                  style: h2Style.copyWith(fontSize: 18.sp)),
              2.vSpace,
              AuthField(
                controller: _registrationNumberController,
                hintText: 'Enter registration number',
                labelText: 'Registration Number*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registration number';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _registrationExpiryController,
                hintText: 'Select expiry date',
                labelText: 'Registration Expiry*',
                onTap: () =>
                    _selectDate(context, _registrationExpiryController),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select expiry date';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _insuranceNumberController,
                hintText: 'Enter insurance number',
                labelText: 'Insurance Number*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter insurance number';
                  }
                  return null;
                },
              ),
              1.vSpace,
              AuthField(
                controller: _insuranceExpiryController,
                hintText: 'Select expiry date',
                labelText: 'Insurance Expiry*',
                onTap: () => _selectDate(context, _insuranceExpiryController),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select expiry date';
                  }
                  return null;
                },
              ),
              3.vSpace,

              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  minimumSize: Size(100.w, 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Return the vehicle data to the previous screen
                    Get.back(result: {
                      'name': _vehicleNameController.text,
                      'category': _selectedVehicleCategory,
                      'number': _vehicleNumberController.text,
                      'manufacturer': _manufacturerController.text,
                      'modelYear': _modelYearController.text,
                      'capacity': _capacityController.text,
                      'dimensions': _dimensionsController.text,
                      'fuelType': _selectedFuelType,
                      'registrationNumber': _registrationNumberController.text,
                      'registrationExpiry': _registrationExpiryController.text,
                      'insuranceNumber': _insuranceNumberController.text,
                      'insuranceExpiry': _insuranceExpiryController.text,
                      'image': 'assets/images/truck1.png', // Default image
                      'rating': '4.5', // Default rating
                    });
                  }
                },
                child: Text('Add Vehicle',
                    style: h3Style.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
