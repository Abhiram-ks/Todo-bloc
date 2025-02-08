import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/bloc/postApi/post_api_bloc.dart';
import 'package:todo_app/presentation/core/widget/snackbar_widget.dart';
import 'package:todo_app/presentation/ui/add/widget/text_fileds.dart';

import '../../core/colors/colors.dart';
import '../../core/constant/constant.dart';
import '../../core/widget/action_buttons.dart';

class CustomeBottmSheet extends StatelessWidget {
   final TextEditingController header;
   final TextEditingController description;

   const CustomeBottmSheet({super.key, required this.header, required this.description,});

  @override
  Widget build(BuildContext context) {
    final postApiBloc = context.read<PostApiBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 560,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: postApiBloc.formKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
              children: [
                 Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_sharp,
                      color: grey, 
                    ),
                  ),
                ),
                CustomTextFormFild(
                    description: description,header: header,color: garen, icon:Icons.check_circle, title:'Organize Your Day',comment:'Plan tasks efficiently to enhance productivity.',
                  ),
                ActionButtons(
                  onCancelPressed: () => Navigator.pop(context),
                  
                  onSubmitPressed: (){
                    postApiBloc.add(SubmitFormEvent(header: header.text, description: description.text));
                  },
                  cancelText: 'Cancel',
                  submitText: 'Confirm',
                ),
                BlocListener<PostApiBloc, PostApiState>(
                  listener: (context, state) {
                    if (state is FormSubmissionSuccessState) {
                      
                      header.clear();
                      description.clear();
                      
                    // ignore: use_build_context_synchronously
                    Future.delayed(Duration.zero, () => Navigator.pop(context));
                      CustomeSnackBar.show(context: context, title:  'Success', description: 'Task was submitted successfully!', backgroundColor: garen, icon: Icons.thumb_up_alt);
            
                    } else if(state is FormSubmissionFailureState){
                      // ignore: use_build_context_synchronously
                      Future.delayed(Duration.zero,() => Navigator.pop(context));
                      CustomeSnackBar.show(context: context, title:  'Task Submission Failed', description: 'Task submission failed. Please try again.', backgroundColor: red, icon: Icons.thumb_down);
                    }
                  },
                  child: SizedBox.shrink()
                ),
               hight30
              ],
            ),
          ),
        ),
      ),
    );
  }
}
