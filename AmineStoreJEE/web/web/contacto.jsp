
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="panel-full">
    <h2 class="center godzilla">Contact Form</h2>
    <div class="flex">
       
        <div class="tam-9">
        <form action="contact" method="POST">
            <div class="form-group">
                <label for="nombre">Name</label>
                <input type="text" id="nombre" class="form-control" name="name" required/>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email"  id="email" class="form-control" name="email" required/>
            </div> 

            <div class="form-group">
                <label for="mensaje">Message</label>
                <textarea cols="5" id="mensaje" class="form-control" name="message" required></textarea>
            </div>

            <div class="fo">
                <button type="submit" class="btn btn-maxi">Send</button>
            </div>
        </form>
        </div>
    </div>

   
</div>