import 'package:commercialapp/views/widgets/default_button.dart';
import 'package:commercialapp/views/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class AddShippingAddressScreen extends StatefulWidget {
  const AddShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddShippingAddressScreen> createState() =>
      _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Shipping Address',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DefaultTextFormField(
                  hintText: 'name',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _fullNameController,
                  type: TextInputType.text,
                  isSecure: false,
                  labelText: 'Full Name',
                ),
                const SizedBox(height: 20,),
                DefaultTextFormField(
                  hintText: 'address',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _addressController,
                  type: TextInputType.text,
                  isSecure: false,
                  labelText: 'Address',
                ),
                const SizedBox(height: 20,),
                DefaultTextFormField(
                  hintText: 'city',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _cityController,
                  type: TextInputType.text,
                  isSecure: false,
                  labelText: 'City',
                ),
                const SizedBox(height: 20,),
                DefaultTextFormField(
                  hintText: 'state',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _stateController,
                  type: TextInputType.text,
                  isSecure: false,
                  labelText: 'State/Province',
                ),
                const SizedBox(height: 20,),
                DefaultTextFormField(
                  hintText: 'zip code',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _zipCodeController,
                  type: TextInputType.number,
                  isSecure: false,
                  labelText: "Zip Code",
                ),
                const SizedBox(height: 20,),
                DefaultTextFormField(
                  hintText: 'country',
                  validate: (value) =>
                  value!.isNotEmpty ? null : 'Please enter your name',
                  controller: _countryController,
                  type: TextInputType.text,
                  isSecure: false,
                  labelText: 'Country',
                ),
                const SizedBox(height: 30,),
                DefaultButton(onPressed: (){}, text: 'Save Address'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
