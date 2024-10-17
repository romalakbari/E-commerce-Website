
<?php $__env->startSection('content'); ?>

    <h2 >Product</h2>
    <p><?php echo e($data['product']); ?></p>
    <ul style="list-style-type: none;">
        <li>Company: <?php echo e($data['company']); ?></li>
        <li>Order Quantity: <?php echo e($data['quantity']); ?></li>
        <li><img src="https://api.azizijobsllc.us/files/order/<?php echo e($data['image']); ?>" /></li>
    </ul>
    <br>
    <p><?php echo e($data['description']); ?></p>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.email_template', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/azizijobsllc_usr/data/www/api.azizijobsllc.us/resources/views/emails/send_to_friend_message.blade.php ENDPATH**/ ?>