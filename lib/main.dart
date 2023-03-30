import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_app/timeWidget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'dateAndtime3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormBuilder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  int currentStep = 0;
  bool isCompleted = false;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();

  final cardNumber = TextEditingController();
  final cardHolder = TextEditingController();
  final expDate = TextEditingController();
  final ccv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormBuilder  Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: FormBuilder(
          key: _formKey,
          child: Stepper(
            steps: getSteps(),
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (step) {
              _formKey.currentState?.validate(); //this will trigger validation
              setState(() {
                currentStep = step;
              });
            },
            onStepContinue: () {
              print(_formKey.currentState?.validate());
              if (_formKey.currentState!.validate()) {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (currentStep == 0) {
                null;
              } else {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text('User Information'),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          content: Column(
            children: [
              fieldMethod(
                  'firstname',
                  'First name',

                  'Please enter your First Name',
                firstName,),
              const SizedBox(height: 10),
              fieldMethod(
                  'lastname',
                  'Last name',
                  'Please enter your Last Name',
                lastName),
              const SizedBox(height: 10),
              fieldMethod(
                  'phonenumber',
                  'Phone number',
                  'Please enter your Phone Number',
                  phoneNumber,
                  ),
              const SizedBox(height: 10),
              fieldMethod(
                  'email',
                  'Email',
                  // fieldController: email,
                  'Please enter your Email',
                  email
                  // errorEmail: 'Please enter a valid email'
                  
                  ),
              const SizedBox(height: 10),
              FormBuilderCheckboxGroup(name: "service", options: [
                optionField('roof', 'ROOFTOP'),
                optionField('residential', 'RESIDENTIAL'),
                optionField('press', 'PRESS'),
                optionField('hgtv', 'HGTV'),
                optionField('park', 'PARK AVE'),
                optionField('design', 'DESIGN'),
                optionField('other', 'OTHER'),
              ]),
              const SizedBox(height: 10),
              FormBuilderTextField(
                minLines: 2,
                maxLines: 10,
                name: 'comment',
                decoration: InputDecoration(
                  hintText: 'Comments(Optional)',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.validate();
                  print(_formKey.currentState!.validate());
                  //print(_formKey.currentState!.fields['service']!.value);
                  /*  print(_formKey.currentState!.fields['firstname']!.value);
                  _formKey.currentState?.invalidateField(
                      name: 'firstname', errorText: 'Enter a valid email');*/
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Choose a Date&Time'),
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          content: Container(height: 600, child: MyHomePage()),
        ),
        Step(
          title: const Text('Card Info'),
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          content: Column(
            children: [
              // fieldMethod(
              //     'cardNumber',
              //     'Card Number',
              //     fieldController: cardNumber,
              //     'Please enter the Card Number',
              //     creditCard: 'Please enter a valid Card Number'),
              const SizedBox(height: 10),
              // fieldMethod(
              //     'cardHolder',
              //     'Card Holder',
              //     fieldController: cardHolder,
              //     'Please enter the Card Holder'),
              const SizedBox(height: 10),
              // fieldMethod(
              //   'expDate',
              //   'Expiration Date',
              //   fieldController: expDate,
              //   'Please enter the Expiration Date',
              //   //numValidation: 'Please enter a valid Phone Number'
              // ),
              const SizedBox(height: 10),
              // fieldMethod(
              //     'ccv',
              //     'ccv',
              //     fieldController: ccv,
              //     'Please enter your CCV',
              //     numValidation: 'Please enter a valid CCV'),
            ],
          ),
        ),
        Step(
          title: const Text('Over view'),
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          content: Center(
            child: Card(
              elevation: 4.0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "First Name:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          firstName.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Last Name:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          lastName.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Phone Number:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          phoneNumber.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Email:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          email.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Card Number:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          cardNumber.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Card Holder:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          cardHolder.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "expiration Date:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          expDate.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "CCV:",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 129, 199, 132)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ccv.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ];









  FormBuilderTextField fieldMethod(nameField, hint, error1,fieldController
      //{fieldController
      //  , errorEmail, numValidation, creditCard}
      ) {

    String NumberError = "Please Enter A Valid Number";

    return FormBuilderTextField(
      name: nameField,
      controller: fieldController,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: error1),
       if(nameField=="phonenumber")

         FormBuilderValidators.integer(errorText: NumberError),
       if(nameField=="email")
         FormBuilderValidators.email(errorText: "not valid email")



        // if (creditCard != null)
        // FormBuilderValidators.creditCard(errorText: creditCard),

      ]),
    );
  }

  FormBuilderFieldOption optionField(fieldValue, fieldChild) {
    return FormBuilderFieldOption(
      value: fieldValue,
      child: Text(fieldChild.toString()),
    );
  }











}



