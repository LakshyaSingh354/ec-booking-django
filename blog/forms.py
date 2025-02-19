from django import forms
from .models import*
from accounts.validators import allow_only_images_validator


class BlogCategoryForm(forms.ModelForm):
    category_image = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    class Meta:
        model=Category
        fields=[
            'category_name','description','category_image','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(BlogCategoryForm, self).__init__(*args, **kwargs)
        self.fields['category_name'].widget.attrs['placeholder'] = 'Category Name'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
class BlogPostForm(forms.ModelForm):
    image = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    class Meta:
        model=Post
        fields=[
            'title','title_tag','content','image','category','author','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(BlogPostForm, self).__init__(*args, **kwargs)
        self.fields['title'].widget.attrs['placeholder'] = 'Title'
        self.fields['title_tag'].widget.attrs['placeholder'] = 'Title Tag'
        self.fields['content'].widget.attrs['placeholder'] = 'Content'
        self.fields['category'].widget.attrs['placeholder'] = 'Category'
        self.fields['author'].widget.attrs['placeholder'] = 'Author'
        
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
                      
      