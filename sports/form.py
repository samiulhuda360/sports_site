from django import forms

class ContactForm(forms.Form):
    name = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'placeholder': 'Name *'}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': 'Email *'}))
    subject = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'placeholder': 'Subject *'}))
    phone = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'placeholder': 'Phone *'}))
    message = forms.CharField(widget=forms.Textarea(attrs={'placeholder': 'Message'}))
